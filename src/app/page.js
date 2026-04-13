"use client";
import { useEffect, useRef, useState } from "react";
import { supabase } from "@/lib/supabase";

export default function Home() {
  // =========================
  // MODE (핵심 추가)
  // =========================
  const [mode, setMode] = useState("single");
  // single = 기존 questions
  // passage = 지문 모드

  // =========================
  // 기존 단일 문제 상태
  // =========================
  const [questions, setQuestions] = useState([]);
  const [current, setCurrent] = useState(0);

  // =========================
  // 지문 모드 상태
  // =========================
  const [passages, setPassages] = useState([]);
  const [passageIndex, setPassageIndex] = useState(0);
  const [questionIndex, setQuestionIndex] = useState(0);

  // =========================
  // 공통 상태
  // =========================
  const [selected, setSelected] = useState(null);
  const [showExplanation, setShowExplanation] = useState(false);
  const [score, setScore] = useState(0);
  const [loading, setLoading] = useState(true);

  const [activeType, setActiveType] = useState("문자·어휘");
  const [activeSubType, setActiveSubType] = useState("랜덤");
  const [grammarContextContent, setGrammarContextContent] = useState("");
  const [grammarContextQuestions, setGrammarContextQuestions] = useState([]);
  const [grammarContextLoading, setGrammarContextLoading] = useState(false);
  const [grammarSelections, setGrammarSelections] = useState({});
  const [grammarContextPassageId, setGrammarContextPassageId] = useState(null);
  const [grammarSolvedPassageIds, setGrammarSolvedPassageIds] = useState([]);
  const [grammarContextExhausted, setGrammarContextExhausted] = useState(false);
  const questionCacheRef = useRef(new Map());
  const passageCacheRef = useRef(new Map());
  const grammarContextCacheRef = useRef(new Map());

  // =========================
  // UTIL
  // =========================
  const shuffleArray = (array) => {
    const newArr = [...array];
    for (let i = newArr.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [newArr[i], newArr[j]] = [newArr[j], newArr[i]];
    }
    return newArr;
  };

  const shuffleOptions = (q) => {
    const opts = [q.option1, q.option2, q.option3, q.option4];
    const correct = opts[q.answer - 1];

    const shuffled = shuffleArray(opts);
    const newAnswer = shuffled.indexOf(correct) + 1;

    return {
      ...q,
      option1: shuffled[0],
      option2: shuffled[1],
      option3: shuffled[2],
      option4: shuffled[3],
      answer: newAnswer,
    };
  };

  const getOptionTextClass = (text) => {
    const length = text?.length || 0;
    if (length <= 14) return "text-base sm:text-lg";
    if (length <= 22) return "text-sm sm:text-base";
    return "text-xs sm:text-sm";
  };

  const getQuestionCacheKey = (type, subType) => `${type}::${subType}`;
  const getPassageCacheKey = (type) => `passage::${type}`;
  const getGrammarCacheKey = (type, subType) => `${type}::${subType}`;

  const getGrammarCorrectIndex = (item) => {
    const numericAnswer = Number(item.answer);
    if (Number.isInteger(numericAnswer) && numericAnswer >= 1 && numericAnswer <= 4) {
      return numericAnswer - 1;
    }

    const answerText = String(item.answer || "").trim();
    const itemOptions = [item.option1, item.option2, item.option3, item.option4].map((opt) =>
      String(opt || "").trim()
    );
    return itemOptions.findIndex((opt) => opt === answerText);
  };

  const handleGrammarOptionClick = (item, idx) => {
    if (grammarSelections[item.id]) return;

    const correctIndex = getGrammarCorrectIndex(item);
    setGrammarSelections((prev) => ({
      ...prev,
      [item.id]: {
        selectedIdx: idx,
        isCorrect: idx === correctIndex,
      },
    }));
  };

  // =========================
  // FETCH (single + passage 분기)
  // =========================
  useEffect(() => {
    const fetchData = async () => {
      setLoading(true);

      // =========================
      // 1. SINGLE MODE (기존)
      // =========================
      if (mode === "single") {
        const questionCacheKey = getQuestionCacheKey(activeType, activeSubType);
        let baseQuestions = questionCacheRef.current.get(questionCacheKey);

        if (!baseQuestions) {
          let query = supabase
            .from("questions")
            .select("id, level, question, option1, option2, option3, option4, answer, explanation, type, sub_type")
            .eq("type", activeType);

          if ((activeType === "문자·어휘" || activeType === "문법") && activeSubType !== "랜덤") {
            query = query.eq("sub_type", activeSubType);
          }

          const { data } = await query;
          baseQuestions = data || [];
          questionCacheRef.current.set(questionCacheKey, baseQuestions);
        }

        if (baseQuestions.length > 0) {
          const processed = shuffleArray(baseQuestions)
            .slice(0, 5)
            .map(shuffleOptions);

          setQuestions(processed);
          setCurrent(0);
        } else {
          setQuestions([]);
        }
      }

      // =========================
      // 2. PASSAGE MODE (신규)
      // =========================
      if (mode === "passage") {
        const passageCacheKey = getPassageCacheKey(activeType);
        let data = passageCacheRef.current.get(passageCacheKey);

        if (!data) {
          const passagesResult = await supabase
            .from("passages")
            .select("id, group_id, content, level, type, sub_type, created_at")
            .eq("type", activeType);

          if (!passagesResult.error && passagesResult.data) {
            const groupIds = [...new Set(passagesResult.data.map((item) => item.group_id).filter(Boolean))];
            const { data: questionData } = groupIds.length
              ? await supabase
                  .from("passage_questions")
                  .select("id, group_id, blank_number, option1, option2, option3, option4, answer, explanation, created_at")
                  .in("group_id", groupIds)
                  .order("blank_number", { ascending: true })
              : { data: [] };

            const questionsByGroup = (questionData || []).reduce((acc, item) => {
              if (!acc[item.group_id]) {
                acc[item.group_id] = [];
              }
              acc[item.group_id].push(item);
              return acc;
            }, {});

            data = passagesResult.data.map((item) => ({
              ...item,
              passage_questions: questionsByGroup[item.group_id] || [],
            }));
            passageCacheRef.current.set(passageCacheKey, data);
          } else {
            data = [];
          }
        }

        if (data && data.length > 0) {
          const selectedPassages = shuffleArray(data).slice(0, 5);
          setPassages(selectedPassages);
          setPassageIndex(0);
          setQuestionIndex(0);
        } else {
          setPassages([]);
        }
      }

      setSelected(null);
      setShowExplanation(false);
      setScore(0);
      setLoading(false);
    };

    fetchData();
  }, [mode, activeType, activeSubType]);

  // =========================
  // 현재 문제 계산
  // =========================
  const passage = passages[passageIndex];

  const q =
    mode === "single"
      ? questions[current]
      : passage?.passage_questions?.[questionIndex];

  const options = q ? [q.option1, q.option2, q.option3, q.option4] : [];
  const isGrammarContext = activeType === "문법" && activeSubType === "문맥";
  const allGrammarQuestionsAnswered =
    grammarContextQuestions.length > 0 &&
    grammarContextQuestions.every((item) => Boolean(grammarSelections[item.id]));

  const loadGrammarContext = async (excludedPassageIds = []) => {
    setGrammarContextLoading(true);

    const grammarCacheKey = getGrammarCacheKey(activeType, activeSubType);
    let cachedGrammarData = grammarContextCacheRef.current.get(grammarCacheKey);

    if (!cachedGrammarData) {
      const allPassagesResult = await supabase
        .from("passages")
        .select("id, content, group_id")
        .eq("type", activeType)
        .eq("sub_type", activeSubType);

      if (allPassagesResult.error || !allPassagesResult.data || allPassagesResult.data.length === 0) {
        setGrammarContextContent("");
        setGrammarContextQuestions([]);
        setGrammarSelections({});
        setGrammarContextPassageId(null);
        setGrammarContextExhausted(true);
        setGrammarContextLoading(false);
        return;
      }

      const groupIds = [...new Set(allPassagesResult.data.map((item) => item.group_id).filter(Boolean))];
      const { data: questionData, error: questionError } = groupIds.length
        ? await supabase
            .from("passage_questions")
            .select("id, group_id, blank_number, option1, option2, option3, option4, answer, explanation, created_at")
            .in("group_id", groupIds)
            .order("blank_number", { ascending: true })
        : { data: [], error: null };

      if (questionError) {
        setGrammarContextContent("");
        setGrammarContextQuestions([]);
        setGrammarSelections({});
        setGrammarContextPassageId(null);
        setGrammarContextExhausted(false);
        setGrammarContextLoading(false);
        return;
      }

      const questionsByGroup = (questionData || []).reduce((acc, item) => {
        if (!acc[item.group_id]) {
          acc[item.group_id] = [];
        }
        acc[item.group_id].push(item);
        return acc;
      }, {});

      cachedGrammarData = allPassagesResult.data.filter(
        (item) => (questionsByGroup[item.group_id] || []).length > 0
      ).map((item) => ({
        ...item,
        passage_questions: questionsByGroup[item.group_id] || [],
      }));

      grammarContextCacheRef.current.set(grammarCacheKey, cachedGrammarData);
    }

    if (!cachedGrammarData || cachedGrammarData.length === 0) {
      setGrammarContextContent("");
      setGrammarContextQuestions([]);
      setGrammarSelections({});
      setGrammarContextPassageId(null);
      setGrammarContextExhausted(true);
      setGrammarContextLoading(false);
      return;
    }

    const availablePassages = cachedGrammarData.filter(
      (item) => !excludedPassageIds.includes(item.id)
    );

    if (availablePassages.length === 0) {
      setGrammarContextPassageId(null);
      setGrammarContextExhausted(true);
      setGrammarContextLoading(false);
      return;
    }

    const randomPassage = availablePassages[Math.floor(Math.random() * availablePassages.length)];

    setGrammarContextContent(randomPassage.content || "");
    setGrammarContextQuestions(randomPassage.passage_questions || []);
    setGrammarSelections({});
    setGrammarContextPassageId(randomPassage.id);
    setGrammarContextExhausted(false);
    setGrammarContextLoading(false);
  };

  const handleRetryGrammarContext = async () => {
    if (!grammarContextPassageId) return;

    const nextSolvedPassageIds = [...grammarSolvedPassageIds, grammarContextPassageId];
    setGrammarSolvedPassageIds(nextSolvedPassageIds);
    await loadGrammarContext(nextSolvedPassageIds);
  };

  const handleRestartGrammarContext = async () => {
    setGrammarSolvedPassageIds([]);
    setGrammarContextExhausted(false);
    await loadGrammarContext([]);
  };

  useEffect(() => {
    if (isGrammarContext) {
      setGrammarSolvedPassageIds([]);
      setGrammarContextExhausted(false);
      loadGrammarContext([]);
    } else {
      setGrammarContextContent("");
      setGrammarContextQuestions([]);
      setGrammarContextLoading(false);
      setGrammarSelections({});
      setGrammarContextPassageId(null);
      setGrammarSolvedPassageIds([]);
      setGrammarContextExhausted(false);
    }
  }, [isGrammarContext]);

  // =========================
  // NEXT LOGIC
  // =========================
  const goNext = () => {
    if (mode === "single") {
      if (current < questions.length - 1) {
        setCurrent((c) => c + 1);
      } else {
        window.location.reload();
      }
    }

    if (mode === "passage") {
      const qs = passage?.passage_questions || [];

      if (questionIndex < qs.length - 1) {
        setQuestionIndex((i) => i + 1);
      } else {
        if (passageIndex < passages.length - 1) {
          setPassageIndex((p) => p + 1);
          setQuestionIndex(0);
        } else {
          window.location.reload();
        }
      }
    }

    setSelected(null);
    setShowExplanation(false);
  };

  // =========================
  // LOADING
  // =========================
  if (loading)
    return (
      <div className="flex min-h-screen w-full items-center justify-center bg-[linear-gradient(180deg,#edf5ff_0%,#f8fbff_100%)] px-4 text-center text-blue-600">
        <div className="w-full max-w-sm rounded-3xl border border-blue-100 bg-white/90 px-5 py-8 shadow-[0_20px_60px_rgba(37,99,235,0.12)] backdrop-blur">
          <div className="mb-3 text-3xl">🌸</div>
          <div className="text-base font-bold">문제를 가져오는 중...</div>
          <div className="mt-2 text-sm text-blue-400">잠시만 기다려 주세요.</div>
        </div>
      </div>
    );

  return (
    <div className="min-h-screen bg-[linear-gradient(180deg,#edf5ff_0%,#f8fbff_55%,#eef4ff_100%)] px-3 py-4 text-slate-900 sm:px-4 sm:py-6">
      <div className="mx-auto flex w-full max-w-md flex-col items-center">

      {/* TITLE */}
      <div className="mb-4 flex w-full items-center justify-center rounded-[28px] border border-white/70 bg-white/85 px-4 py-3 shadow-[0_18px_45px_rgba(37,99,235,0.10)] backdrop-blur">
        <h1 className="text-[1.85rem] font-black tracking-[-0.03em] text-blue-600">
          🌸 JLPT 연습
        </h1>
      </div>

      {/* TYPE TAB */}
      <TypeTabs
        activeType={activeType}
        setActiveType={setActiveType}
        setActiveSubType={setActiveSubType}
      />

      {/* SUB TYPE */}
      {(activeType === "문자·어휘" || activeType === "문법") && (
        <div className="mb-4 flex w-full max-w-md snap-x snap-mandatory gap-2 overflow-x-auto pb-1 [-ms-overflow-style:none] [scrollbar-width:none] [&::-webkit-scrollbar]:hidden">
          {(activeType === "문법"
            ? ["랜덤", "판단", "배열", "문맥"]
            : ["랜덤", "한자 읽기", "표기", "문맥 규정"]
          ).map((sub) => (
            <button
              key={sub}
              onClick={() => setActiveSubType(sub)}
              className={`min-h-11 shrink-0 snap-start rounded-full border px-4 py-2 text-sm font-semibold transition active:scale-[0.98] ${
                activeSubType === sub
                  ? "border-blue-500 bg-blue-100 text-blue-700 shadow-[0_10px_30px_rgba(59,130,246,0.18)]"
                  : "border-slate-200 bg-white text-slate-600"
              }`}
            >
              {sub}
            </button>
          ))}
        </div>
      )}

      {/* PASSAGE UI (🔥 핵심 추가) */}
      {mode === "passage" && (
        <div className="mb-4 w-full max-w-md rounded-[24px] border border-slate-200 bg-white px-4 py-4 text-[15px] leading-7 whitespace-pre-line shadow-[0_18px_40px_rgba(15,23,42,0.06)]">
          {passage?.content}
        </div>
      )}

      {/* QUESTION CARD */}
      <div className="w-full max-w-md rounded-[28px] border border-white/70 bg-white/92 p-4 shadow-[0_24px_60px_rgba(15,23,42,0.10)] backdrop-blur sm:p-5">
        {isGrammarContext ? (
          <>
            <div className="mb-3 flex justify-between text-[11px] font-semibold tracking-[0.08em] text-slate-400">
              <span>문맥</span>
              <span />
            </div>

            <div className="mb-4 rounded-[24px] border-[3px] border-blue-500 bg-gradient-to-b from-white to-blue-50/30 px-4 py-4 text-[15px] leading-8 whitespace-pre-line text-slate-800 shadow-[inset_0_1px_0_rgba(255,255,255,0.7)] sm:px-5">
              {grammarContextLoading
                ? "데이터를 불러오는 중입니다..."
                : grammarContextContent || "데이터 준비중입니다"}
            </div>

            {grammarContextLoading ? null : grammarContextQuestions.length > 0 ? (
              <div className="space-y-3">
                {grammarContextQuestions.map((item) => (
                  <div key={item.id} className="rounded-[24px] border border-slate-200 bg-white px-3 py-3 shadow-[0_10px_25px_rgba(15,23,42,0.05)] sm:px-4">
                    <div className="mb-3 text-base font-extrabold text-slate-900">
                      {item.blank_number}.
                    </div>
                    <div className="grid grid-cols-2 gap-2 text-sm">
                      {[item.option1, item.option2, item.option3, item.option4].map((choice, idx) => {
                        const selection = grammarSelections[item.id];
                        const correctIndex = getGrammarCorrectIndex(item);
                        let style = "border-slate-200 bg-white text-slate-800";

                        if (selection) {
                          if (idx === correctIndex) {
                            style = "border-emerald-400 bg-emerald-50 text-emerald-900";
                          } else if (idx === selection.selectedIdx) {
                            style = "border-rose-400 bg-rose-50 text-rose-900";
                          }
                        }

                        return (
                          <button
                            key={idx}
                            onClick={() => handleGrammarOptionClick(item, idx)}
                            className={`min-h-[52px] rounded-2xl border px-3 py-3 text-left text-[15px] font-medium leading-5 shadow-sm transition active:scale-[0.985] ${style}`}
                          >
                            {choice}
                          </button>
                        );
                      })}
                    </div>

                    {grammarSelections[item.id] && (
                      <div className="mt-3 rounded-2xl bg-slate-50 px-3 py-3 text-[14px] leading-6 text-slate-600">
                        {grammarSelections[item.id].isCorrect ? "정답입니다. " : "오답입니다. "}
                        {item.explanation || "해설이 없습니다."}
                      </div>
                    )}
                  </div>
                ))}

                {allGrammarQuestionsAnswered && !grammarContextExhausted && (
                  <button
                    onClick={handleRetryGrammarContext}
                    className="min-h-[54px] w-full rounded-2xl bg-blue-600 px-4 py-3 text-sm font-semibold text-white shadow-[0_16px_40px_rgba(37,99,235,0.28)] transition active:scale-[0.99]"
                  >
                    또 풀어보기
                  </button>
                )}

                {allGrammarQuestionsAnswered && grammarContextExhausted && (
                  <button
                    onClick={handleRestartGrammarContext}
                    className="min-h-[54px] w-full rounded-2xl border border-blue-200 bg-blue-50 px-4 py-3 text-center text-sm font-semibold text-blue-700 transition active:scale-[0.99]"
                  >
                    준비된 모든 문제를 푸셨군요, 다시 해볼까요?
                  </button>
                )}
              </div>
            ) : (
              <div className="text-center py-8">
                <p className="text-gray-500 text-base">
                  {grammarContextExhausted ? "준비된 모든 문제를 푸셨군요, 다시 해볼까요?" : "데이터가 없습니다."}
                </p>
              </div>
            )}
          </>
        ) : q ? (
          <>
            {/* PROGRESS */}
            <div className="mb-3 flex justify-between text-[11px] font-semibold tracking-[0.08em] text-slate-400">
              <span>{mode === "single" ? q.sub_type || q.type : passage?.sub_type || passage?.type || activeType}</span>
              <span>
                {mode === "single"
                  ? `${current + 1} / ${questions.length}`
                  : `${passageIndex + 1} / ${passages.length}`}
              </span>
            </div>

            {/* QUESTION */}
            <div className="mb-5 rounded-[22px] bg-slate-50 px-4 py-4 text-center text-[17px] font-bold leading-8 text-slate-900 sm:text-lg">
              {mode === "single" ? (
                q.question.split("____").map((part, i, arr) => (
                  <span key={i}>
                    {part}
                    {i < arr.length - 1 && (
                      <span className="text-blue-500 font-bold">____</span>
                    )}
                  </span>
                ))
              ) : (
                <span>빈칸 {q.blank_number}</span>
              )}
            </div>

            {/* OPTIONS */}
            <div className="grid gap-2.5">
              {options.map((opt, i) => {
                let style = "border-slate-200 bg-white text-slate-800";

                if (showExplanation) {
                  if (i + 1 === q.answer) style = "border-emerald-400 bg-emerald-50 text-emerald-900";
                  else if (selected === i) style = "border-rose-400 bg-rose-50 text-rose-900";
                }

                return (
                  <button
                    key={i}
                    onClick={() => {
                      if (showExplanation) return;

                      setSelected(i);
                      setShowExplanation(true);

                      if (i + 1 === q.answer) {
                        setScore((s) => s + 1);
                      }
                    }}
                    className={`min-h-[60px] rounded-2xl border px-3 py-3 text-left shadow-sm transition active:scale-[0.985] ${style}`}
                  >
                    <div className="flex items-start gap-3">
                      <span className="mt-0.5 inline-flex h-6 w-6 shrink-0 items-center justify-center rounded-full bg-blue-50 text-xs font-bold text-blue-600">
                        {i + 1}
                      </span>
                      <span className={getOptionTextClass(opt)}>{opt}</span>
                    </div>
                  </button>
                );
              })}
            </div>

            {/* EXPLANATION + NEXT */}
            {showExplanation && (
              <div className="mt-5">
                <div className="mb-3 rounded-2xl bg-slate-50 px-4 py-3 text-sm leading-6 text-slate-600">
                  💡 {q.explanation}
                </div>

                <button
                  onClick={goNext}
                  className="min-h-[54px] w-full rounded-2xl bg-blue-600 p-3 text-white shadow-[0_16px_40px_rgba(37,99,235,0.28)] transition active:scale-[0.99]"
                >
                  다음
                </button>
              </div>
            )}
          </>
        ) : (
          <div className="text-center py-8">
            <p className="text-gray-500 text-base">
              {activeType === "문법"
                ? "데이터 준비중입니다"
                : "해당 분류에 등록된 문제가 없습니다."}
            </p>
          </div>
        )}
      </div>
      </div>
    </div>
  );
}

function TypeTabs({ activeType, setActiveType, setActiveSubType }) {
  const types = [
    { name: "문자·어휘" },
    { name: "문법" },
    { name: "독해" },
    { name: "청해" },
  ];

  return (
    <div className="mb-4 grid w-full max-w-md grid-cols-2 gap-2">
      {types.map((type) => (
        <button
          key={type.name}
          onClick={() => {
            setActiveType(type.name);
            setActiveSubType("랜덤");
          }}
          className={`min-h-[52px] rounded-2xl px-3 py-3 text-sm font-semibold transition active:scale-[0.98] ${
            activeType === type.name
              ? "bg-blue-600 text-white shadow-[0_16px_40px_rgba(37,99,235,0.28)]"
              : "bg-white text-slate-600 shadow-[0_10px_25px_rgba(15,23,42,0.05)]"
          }`}
        >
          {type.name}
        </button>
      ))}
    </div>
  );
}