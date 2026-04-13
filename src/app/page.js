"use client";
import { useEffect, useMemo, useRef, useState } from "react";
import { supabase } from "@/lib/supabase";

export default function Home() {
  const [mode, setMode] = useState("single");

  const [questions, setQuestions] = useState([]);
  const [current, setCurrent] = useState(0);

  const [passages, setPassages] = useState([]);
  const [passageIndex, setPassageIndex] = useState(0);
  const [questionIndex, setQuestionIndex] = useState(0);

  const [selected, setSelected] = useState(null);
  const [showExplanation, setShowExplanation] = useState(false);
  const [score, setScore] = useState(0);
  const [loading, setLoading] = useState(true);
  const [retryNonce, setRetryNonce] = useState(0);

  const [activeType, setActiveType] = useState("문자·어휘");
  const [activeSubType, setActiveSubType] = useState("랜덤");

  // UX 개선을 위한 상태 및 Ref 추가
  const [isPassageExpanded, setIsPassageExpanded] = useState(false);
  const explanationRef = useRef(null);

  const questionCacheRef = useRef(new Map());
  const passageCacheRef = useRef(new Map());

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

    return {
      ...q,
      option1: shuffled,
      option2: shuffled,
      option3: shuffled,
      option4: shuffled,
      answer: shuffled.indexOf(correct) + 1,
    };
  };

  useEffect(() => {
    setMode(activeType === "독해" ? "passage" : "single");
  }, [activeType]);

  useEffect(() => {
    const fetchData = async () => {
      setLoading(true);

      if (mode === "single") {
        const { data } = await supabase
          .from("questions")
          .select("*")
          .eq("type", activeType);

        const processed = shuffleArray(data || [])
          .slice(0, 5)
          .map(shuffleOptions);

        setQuestions(processed);
        setCurrent(0);
      }

      if (mode === "passage") {
        const { data: passagesData } = await supabase
          .from("passages")
          .select("*")
          .eq("type", activeType);

        const groupIds = passagesData.map((p) => p.group_id);

        const { data: questionData } = await supabase
          .from("passage_questions")
          .select("*")
          .in("group_id", groupIds)
          .order("blank_number", { ascending: true });

        const map = {};
        questionData.forEach((q) => {
          if (!map[q.group_id]) map[q.group_id] = [];
          map[q.group_id].push(q);
        });

        const merged = passagesData.map((p) => ({
          ...p,
          passage_questions: map[p.group_id] || [],
        }));

        setPassages(shuffleArray(merged).slice(0, 5));
        setPassageIndex(0);
        setQuestionIndex(0);
      }

      setSelected(null);
      setShowExplanation(false);
      setScore(0);
      setLoading(false);
    };

    fetchData();
  }, [mode, activeType, retryNonce]);

  const passage = passages[passageIndex];

  const sortedQuestions = useMemo(() => {
    return [...(passage?.passage_questions || [])].sort(
      (a, b) => a.blank_number - b.blank_number
    );
  }, [passage]);

  const q =
    mode === "single"
      ? questions[current]
      : sortedQuestions[questionIndex];

  const options = q
    ? [q.option1, q.option2, q.option3, q.option4]
    : [];

  const goNext = () => {
    if (mode === "single") {
      if (current < questions.length - 1) setCurrent(current + 1);
    } else {
      if (questionIndex < sortedQuestions.length - 1) {
        setQuestionIndex(questionIndex + 1);
      } else if (passageIndex < passages.length - 1) {
        setPassageIndex(passageIndex + 1);
        setQuestionIndex(0);
      }
    }

    setSelected(null);
    setShowExplanation(false);
  };

  // 새로운 지문으로 넘어갈 때 아코디언 상태 초기화
  useEffect(() => {
    setIsPassageExpanded(false);
  }, [passageIndex]);

  // 해설이 나타나면 자동으로 화면 스크롤
  useEffect(() => {
    if (showExplanation && explanationRef.current) {
      setTimeout(() => {
        explanationRef.current.scrollIntoView({
          behavior: "smooth",
          block: "nearest",
        });
      }, 100);
    }
  }, [showExplanation]);

  if (loading)
    return (
      <div className="flex min-h-screen items-center justify-center text-blue-600 bg-slate-50">
        <div className="text-xl font-bold animate-pulse">로딩중...</div>
      </div>
    );

  return (
    // 하단 고정 버튼이 콘텐츠를 가리지 않도록 pb-28 적용
    <div className="min-h-screen px-4 py-6 bg-slate-50 pb-28">
      <div className="mx-auto max-w-md">

        {/* TITLE */}
        <h1 className="text-2xl font-bold text-center text-blue-600 mb-6">
          JLPT 연습
        </h1>

        {/* TYPE: grid-cols-3으로 변경하여 3개 버튼이 꽉 차게 배치 */}
        <div className="grid grid-cols-3 gap-2 mb-6">
          {["문자·어휘", "문법", "독해"].map((t) => (
            <button
              key={t}
              onClick={() => setActiveType(t)}
              className={`h-12 rounded-xl text-[15px] font-medium transition-colors ${
                activeType === t
                  ? "bg-blue-600 text-white shadow-sm"
                  : "bg-white border text-slate-500 hover:bg-slate-50"
              }`}
            >
              {t}
            </button>
          ))}
        </div>

        {/* PASSAGE: 내부 스크롤 제거 및 아코디언(펼쳐보기) UI 적용, 글자 크기 증가 */}
        {mode === "passage" && passage && (
          <div className="mb-4 bg-white p-4 rounded-xl border shadow-sm">
            <div
              className={`text-base leading-relaxed text-gray-800 transition-all ${
                isPassageExpanded ? "" : "line-clamp-4"
              }`}
            >
              {passage?.content}
            </div>
            <button
              onClick={() => setIsPassageExpanded(!isPassageExpanded)}
              className="mt-3 w-full py-2 bg-blue-50 text-blue-600 text-sm font-semibold rounded-lg active:scale-95 transition-transform"
            >
              {isPassageExpanded ? "지문 접기 ▴" : "지문 전체 보기 ▾"}
            </button>
          </div>
        )}

        {/* QUESTION */}
        {q && (
          <div className="bg-white p-4 md:p-5 rounded-xl border shadow-sm">

            {/* 시인성 개선을 위해 text-gray-500 적용 */}
            <div className="text-sm font-medium text-gray-500 mb-2">
              {mode === "single"
                ? `문제 ${current + 1} / 5`
                : `문제 ${passageIndex + 1}-${questionIndex + 1}`}
            </div>

            {/* 글자 크기 text-lg로 상향 */}
            <div className="text-lg font-bold text-gray-900 mb-5 leading-snug">
              {mode === "single"
                ? q.question
                : `${q.blank_number}. ${q.question}`}
            </div>

            <div className="space-y-3">
              {options.map((opt, i) => {
                // 기본 스타일
                let style = "bg-white border-gray-200 text-gray-700 hover:bg-slate-50";

                if (showExplanation) {
                  if (i + 1 === q.answer) {
                    // 정답: 텍스트 색상 및 굵기 추가
                    style = "bg-emerald-50 border-emerald-500 text-emerald-700 font-bold z-10 relative";
                  } else if (selected === i) {
                    // 오답(내가 선택한 것): 텍스트 색상 및 굵기 추가
                    style = "bg-rose-50 border-rose-500 text-rose-700 font-bold z-10 relative";
                  } else {
                    // 선택하지 않은 오답: 시각적 비활성화(투명도)
                    style = "bg-gray-50 border-gray-100 text-gray-400 opacity-50";
                  }
                }

                return (
                  <button
                    key={i}
                    disabled={showExplanation} // 실제 클릭 비활성화
                    onClick={() => {
                      if (showExplanation) return;
                      setSelected(i);
                      setShowExplanation(true);
                    }}
                    className={`w-full min-h-[56px] px-4 py-3 text-left rounded-xl border-2 transition-all duration-200 ${style} ${
                      !showExplanation && "active:scale-[0.98]"
                    }`}
                  >
                    {opt}
                  </button>
                );
              })}
            </div>

            {/* EXPLANATION */}
            {showExplanation && (
              <div ref={explanationRef} className="mt-6 animate-fade-in">
                <div className="bg-blue-50 border border-blue-100 p-4 rounded-xl text-[15px] text-blue-900 leading-relaxed">
                  <span className="font-bold mr-1">💡 해설:</span>
                  {q.explanation}
                </div>
              </div>
            )}
          </div>
        )}
      </div>

      {/* FIXED NEXT BUTTON: 화면 하단에 고정되어 스크롤과 무관하게 항상 보이도록 처리 */}
      {showExplanation && (
        <div className="fixed bottom-0 left-0 w-full p-4 bg-white/90 backdrop-blur-sm border-t shadow-[0_-4px_6px_-1px_rgba(0,0,0,0.05)] z-50">
          <div className="mx-auto max-w-md">
            <button
              onClick={goNext}
              className="w-full h-[52px] bg-blue-600 hover:bg-blue-700 text-white font-bold rounded-xl text-lg transition-colors active:scale-[0.98]"
            >
              다음 문제
            </button>
          </div>
        </div>
      )}
    </div>
  );
}