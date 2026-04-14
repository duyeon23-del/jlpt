
"use client";
import { useEffect, useRef, useState } from "react";
import { supabase } from "@/lib/supabase";
import { useUser } from "@/lib/useUser";
import Onboarding from "@/components/Onboarding";

export default function Home() {

  // =========================
  // MODE (핵심 추가)
  // =========================
  // useUser 훅
  const { userTarget, loading: userLoading, error: userError, setGoal, clearGoal, hasTarget } = useUser();
  
  // viewMode: onboarding -> dashboard -> study/wrong_notes
  const [viewMode, setViewMode] = useState("entry");
  const [noExamMode, setNoExamMode] = useState(false);
  const [flowReady, setFlowReady] = useState(false);

  // MODE (단일/지문 모드)
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
  const [retryNonce, setRetryNonce] = useState(0);
  const [activeType, setActiveType] = useState("문자·어휘");
  const [activeSubType, setActiveSubType] = useState("랜덤");
  const [grammarContextContent, setGrammarContextContent] = useState("");
  const [grammarContextQuestions, setGrammarContextQuestions] = useState([]);
  const [grammarContextLoading, setGrammarContextLoading] = useState(false);
  const [grammarSelections, setGrammarSelections] = useState({});
  const [grammarContextPassageId, setGrammarContextPassageId] = useState(null);
  const [grammarSolvedPassageIds, setGrammarSolvedPassageIds] = useState([]);
  const [grammarContextExhausted, setGrammarContextExhausted] = useState(false);
  const initialRouteDecidedRef = useRef(false);
  const questionCacheRef = useRef(new Map());
  const passageCacheRef = useRef(new Map());
  const grammarContextCacheRef = useRef(new Map());
  const wrongAnswerAuthUnavailableRef = useRef(false);
  const [wrongAnswers, setWrongAnswers] = useState([]);
  const [wrongAnswersLoading, setWrongAnswersLoading] = useState(false);
  const [wrongAnswersError, setWrongAnswersError] = useState("");
  const [wrongTypeFilter, setWrongTypeFilter] = useState("all");
  const [wrongStatusFilter, setWrongStatusFilter] = useState("all");
  const [wrongQuestionMetaMap, setWrongQuestionMetaMap] = useState({});

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

  // onboarding 완료 후 study로 이동
  const handleOnboardingComplete = async (examDate) => {
    const success = await setGoal(examDate);
    if (success) {
      if (typeof window !== "undefined") {
        localStorage.removeItem("noExamMode");
      }
      setNoExamMode(false);
      setViewMode("study");
    }
    return success;
  };

  // onboarding 취소
  const handleOnboardingCancel = () => {
    setViewMode("study");
  };

  const handleNoExamEntry = async () => {
    if (hasTarget) {
      const cleared = await clearGoal();
      if (!cleared) {
        return false;
      }
    }

    if (typeof window !== "undefined") {
      localStorage.setItem("noExamMode", "true");
    }

    setNoExamMode(true);
    setViewMode("study");
    return true;
  };

  useEffect(() => {
    if (typeof window === "undefined") return;
    setNoExamMode(localStorage.getItem("noExamMode") === "true");
    setFlowReady(true);
  }, []);

  // 진입 상태 동기화
  useEffect(() => {
    if (!flowReady) return;

    if (!initialRouteDecidedRef.current) {
      setViewMode(hasTarget || noExamMode ? "study" : "entry");
      initialRouteDecidedRef.current = true;
    }

    if (hasTarget) {
      if (typeof window !== "undefined") {
        localStorage.removeItem("noExamMode");
      }
      setNoExamMode(false);
      return;
    }

    if (noExamMode) {
      if (viewMode === "entry") {
        setViewMode("study");
      }
      return;
    }

    setViewMode("entry");
  }, [flowReady, hasTarget, noExamMode]);

  const shuffleOptions = (q) => {
    const opts = [q.option1, q.option2, q.option3, q.option4];
    const correct = q.answer;
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

  const normalizeMultilineText = (text) => String(text || "").replace(/\\n/g, "\n");

  const getQuestionCacheKey = (type, subType) => `${type}::${subType}`;
  const getPassageCacheKey = (type, subType) => `passage::${type}::${subType}`;
  const getGrammarCacheKey = (type, subType) => `${type}::${subType}`;
  const getPassageQuestionJoinKey = (groupId, type, subType) => `${groupId}::${type}::${subType || ""}`;

  const getWrongAnswerUserId = async () => {
    const {
      data: { user },
    } = await supabase.auth.getUser();

    if (user?.id) {
      return user.id;
    }

    if (wrongAnswerAuthUnavailableRef.current) {
      return null;
    }

    const { data, error } = await supabase.auth.signInAnonymously();

    if (error || !data?.user?.id) {
      wrongAnswerAuthUnavailableRef.current = true;

      if (error?.code === "anonymous_provider_disabled") {
        console.warn("wrong_answers save skipped: anonymous auth is disabled.");
      } else {
        console.warn("wrong_answers save skipped: no authenticated user.", error);
      }

      return null;
    }

    return data.user.id;
  };

  const saveWrongAnswer = async ({ questionId, questionType, selectedAnswer }) => {
    if (!questionId || !questionType) {
      return;
    }

    try {
      const userId = await getWrongAnswerUserId();

      if (!userId) {
        return;
      }

      const { error } = await supabase.from("wrong_answers").insert({
        user_id: userId,
        question_id: String(questionId),
        question_type: questionType,
        selected_answer: selectedAnswer ?? null,
        is_resolved: false,
        resolved_at: null,
        note: null,
      });

      if (error) {
        if (error.code === "23505") {
          console.warn("History mode requires removing UNIQUE(user_id, question_type, question_id) on wrong_answers.");
          return;
        }
        console.error("Failed to save wrong answer", error);
      }
    } catch (error) {
      console.error("Failed to save wrong answer", error);
    }
  };

  const loadWrongQuestionMeta = async (rows) => {
    const singleIds = [...new Set(rows.filter((item) => item.question_type === "single").map((item) => item.question_id))];
    const passageLikeIds = [
      ...new Set(
        rows
          .filter((item) => item.question_type === "passage" || item.question_type === "grammar_context")
          .map((item) => item.question_id)
      ),
    ];

    const nextMetaMap = {};

    if (singleIds.length > 0) {
      const { data } = await supabase
        .from("questions")
        .select("id, question, explanation, type, sub_type")
        .in("id", singleIds);

      (data || []).forEach((item) => {
        nextMetaMap[`single:${String(item.id)}`] = item;
      });
    }

    if (passageLikeIds.length > 0) {
      const { data } = await supabase
        .from("passage_questions")
        .select("id, question, blank_number, explanation, type, sub_type")
        .in("id", passageLikeIds);

      (data || []).forEach((item) => {
        nextMetaMap[`passage:${String(item.id)}`] = item;
        nextMetaMap[`grammar_context:${String(item.id)}`] = item;
      });
    }

    setWrongQuestionMetaMap(nextMetaMap);
  };

  const loadWrongAnswers = async () => {
    setWrongAnswersLoading(true);
    setWrongAnswersError("");

    try {
      const userId = await getWrongAnswerUserId();

      if (!userId) {
        setWrongAnswers([]);
        setWrongQuestionMetaMap({});
        setWrongAnswersError("로그인 세션을 확인할 수 없어 오답노트를 불러오지 못했습니다.");
        setWrongAnswersLoading(false);
        return;
      }

      const { data, error } = await supabase
        .from("wrong_answers")
        .select("id, question_id, question_type, selected_answer, is_resolved, resolved_at, note, created_at")
        .order("created_at", { ascending: false })
        .limit(200);

      if (error) {
        setWrongAnswersError("오답노트 조회 중 오류가 발생했습니다.");
        setWrongAnswers([]);
        setWrongQuestionMetaMap({});
        setWrongAnswersLoading(false);
        return;
      }

      const rows = data || [];
      setWrongAnswers(rows);
      await loadWrongQuestionMeta(rows);
    } catch (error) {
      console.error("Failed to load wrong answers", error);
      setWrongAnswersError("오답노트 조회 중 오류가 발생했습니다.");
      setWrongAnswers([]);
      setWrongQuestionMetaMap({});
    }

    setWrongAnswersLoading(false);
  };

  const markWrongAnswerResolved = async (id) => {
    const { error } = await supabase
      .from("wrong_answers")
      .update({
        is_resolved: true,
        resolved_at: new Date().toISOString(),
      })
      .eq("id", id);

    if (error) {
      console.error("Failed to mark wrong answer resolved", error);
      return;
    }

    setWrongAnswers((prev) =>
      prev.map((item) =>
        item.id === id
          ? {
              ...item,
              is_resolved: true,
              resolved_at: new Date().toISOString(),
            }
          : item
      )
    );
  };

  const removeWrongAnswer = async (id) => {
    const { error } = await supabase.from("wrong_answers").delete().eq("id", id);

    if (error) {
      console.error("Failed to delete wrong answer", error);
      return;
    }

    setWrongAnswers((prev) => prev.filter((item) => item.id !== id));
  };

  useEffect(() => {
    setMode(activeType === "독해" ? "passage" : "single");
  }, [activeType]);

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
    const isCorrect = idx === correctIndex;

    setGrammarSelections((prev) => ({
      ...prev,
      [item.id]: {
        selectedIdx: idx,
        isCorrect,
      },
    }));

    if (!isCorrect) {
      saveWrongAnswer({
        questionId: item.id,
        questionType: "grammar_context",
        selectedAnswer: idx + 1,
      });
    }
  };

  // =========================
  // FETCH (single + passage 분기)
  // =========================
  useEffect(() => {
    const fetchData = async () => {
      if (viewMode !== "study") {
        setLoading(false);
        return;
      }

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
        const passageCacheKey = getPassageCacheKey(activeType, activeSubType);
        let data = passageCacheRef.current.get(passageCacheKey);

        if (!data) {
          let passagesQuery = supabase
            .from("passages")
            .select("id, group_id, content, level, type, sub_type, created_at")
            .eq("type", activeType);

          if (activeSubType !== "랜덤") {
            passagesQuery = passagesQuery.eq("sub_type", activeSubType);
          }

          const passagesResult = await passagesQuery;

          if (!passagesResult.error && passagesResult.data) {
            const groupIds = [...new Set(passagesResult.data.map((item) => item.group_id).filter(Boolean))];
            let questionsQuery = supabase
              .from("passage_questions")
              .select("id, group_id, type, sub_type, question, blank_number, option1, option2, option3, option4, answer, explanation, created_at")
              .in("group_id", groupIds)
              .eq("type", activeType)
              .order("blank_number", { ascending: true });

            if (activeSubType !== "랜덤") {
              questionsQuery = questionsQuery.eq("sub_type", activeSubType);
            }

            const { data: questionData } = groupIds.length
              ? await questionsQuery
              : { data: [] };

            const questionsByGroup = (questionData || []).reduce((acc, item) => {
              const key = getPassageQuestionJoinKey(item.group_id, item.type, item.sub_type);
              if (!acc[key]) {
                acc[key] = [];
              }
              acc[key].push(item);
              return acc;
            }, {});

            data = passagesResult.data.map((item) => ({
              ...item,
              passage_questions: questionsByGroup[getPassageQuestionJoinKey(item.group_id, item.type, item.sub_type)] || [],
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
  }, [mode, activeType, activeSubType, retryNonce, viewMode]);

  useEffect(() => {
    if (viewMode === "wrong_notes") {
      loadWrongAnswers();
    }
  }, [viewMode]);

  // =========================
  // 현재 문제 계산
  // =========================
  const passage = passages[passageIndex];
  const sortedPassageQuestions =
    mode === "passage"
      ? [...(passage?.passage_questions || [])].sort((a, b) => Number(a.blank_number) - Number(b.blank_number))
      : [];

  const q =
    mode === "single"
      ? questions[current]
      : sortedPassageQuestions[questionIndex];

  const options = q ? [q.option1, q.option2, q.option3, q.option4] : [];
  const isGrammarContext = activeType === "문법" && activeSubType === "문맥";
  const isLastSingleQuestion = mode === "single" && current === questions.length - 1;
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
            .select("id, group_id, type, sub_type, question, blank_number, option1, option2, option3, option4, answer, explanation, created_at")
            .in("group_id", groupIds)
            .eq("type", activeType)
            .eq("sub_type", activeSubType)
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
        const key = getPassageQuestionJoinKey(item.group_id, item.type, item.sub_type);
        if (!acc[key]) {
          acc[key] = [];
        }
        acc[key].push(item);
        return acc;
      }, {});

      cachedGrammarData = allPassagesResult.data.filter(
        (item) => (questionsByGroup[getPassageQuestionJoinKey(item.group_id, activeType, activeSubType)] || []).length > 0
      ).map((item) => ({
        ...item,
        passage_questions: questionsByGroup[getPassageQuestionJoinKey(item.group_id, activeType, activeSubType)] || [],
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
    if (viewMode !== "study") {
      return;
    }

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
  }, [isGrammarContext, viewMode]);

  // =========================
  // NEXT LOGIC
  // =========================
  const goNext = () => {
    if (mode === "single") {
      if (current < questions.length - 1) {
        setCurrent((c) => c + 1);
      } else {
        return;
      }
    }

    if (mode === "passage") {
      const qs = sortedPassageQuestions;

      if (questionIndex < qs.length - 1) {
        setQuestionIndex((i) => i + 1);
      } else {
        if (passageIndex < passages.length - 1) {
          setPassageIndex((p) => p + 1);
          setQuestionIndex(0);
        } else {
          return;
        }
      }
    }

    setSelected(null);
    setShowExplanation(false);
  };

  const handleRetryCurrentSet = () => {
    setSelected(null);
    setShowExplanation(false);
    setCurrent(0);
    setRetryNonce((n) => n + 1);
  };

  const getWrongTypeLabel = (questionType) => {
    if (questionType === "single") return "단일";
    if (questionType === "passage") return "독해";
    if (questionType === "grammar_context") return "문맥";
    return questionType;
  };

  const getWrongQuestionMeta = (item) => wrongQuestionMetaMap[`${item.question_type}:${String(item.question_id)}`];

  const filteredWrongAnswers = wrongAnswers.filter((item) => {
    if (wrongTypeFilter !== "all" && item.question_type !== wrongTypeFilter) {
      return false;
    }

    if (wrongStatusFilter === "open" && item.is_resolved) {
      return false;
    }

    if (wrongStatusFilter === "resolved" && !item.is_resolved) {
      return false;
    }

    return true;
  });

  // =========================
  // LOADING
  // =========================
  if (userLoading) {
    return (
      <div className="flex min-h-screen items-center justify-center">
        <div className="text-center">
          <div className="text-3xl mb-2">🌸</div>
          <p className="text-slate-600 font-semibold">초기화 중...</p>
        </div>
      </div>
    );
  }

  // Entry 화면
  if (viewMode === "entry") {
    return (
      <Onboarding
        onComplete={handleOnboardingComplete}
        onNoExam={handleNoExamEntry}
        errorMessage={userError}
        isEditing={hasTarget}
        initialExamDate={userTarget?.exam_date}
        onCancel={handleOnboardingCancel}
      />
    );
  }

  // study/wrong_notes에서만 로딩 표시
  if (viewMode !== "dashboard" && loading)
    return (
      <div className="flex min-h-screen w-full items-center justify-center bg-[linear-gradient(180deg,#edf5ff_0%,#f8fbff_100%)] px-4 text-center text-blue-700">
        <div className="w-full max-w-sm rounded-3xl border border-blue-100 bg-white/90 px-5 py-8 shadow-[0_20px_60px_rgba(37,99,235,0.12)] backdrop-blur">
          <div className="mb-3 text-3xl">🌸</div>
          <div className="text-lg font-extrabold">문제를 가져오는 중...</div>
          <div className="mt-2 text-base text-blue-500">잠시만 기다려 주세요.</div>
        </div>
      </div>
    );

  return (
    <div className="min-h-screen bg-[linear-gradient(180deg,#edf5ff_0%,#f8fbff_55%,#eef4ff_100%)] px-3 py-4 text-slate-900 sm:px-4 sm:py-6">
      <div className="mx-auto flex w-full max-w-md flex-col items-center">

      {/* TITLE */}
      <div className="mb-3 flex w-full items-center justify-between rounded-2xl border border-white/70 bg-white/85 px-3 py-2 shadow-[0_10px_30px_rgba(37,99,235,0.08)] backdrop-blur">
        <h1 className="text-[1.5rem] font-black tracking-[-0.02em] text-blue-700 sm:text-[1.6rem]">
          🌸 나만의 JLPT 연습
        </h1>
        {hasTarget ? (
          <button
            onClick={() => setViewMode("entry")}
            className="rounded-full border border-blue-200 bg-blue-50 px-3 py-1 text-sm font-black text-blue-700 transition hover:bg-blue-100 active:scale-[0.98]"
          >
            D-{Math.ceil((new Date(userTarget.exam_date) - new Date()) / (1000 * 60 * 60 * 24))}
          </button>
        ) : noExamMode ? (
          <button
            onClick={() => setViewMode("entry")}
            className="rounded-full border border-slate-300 bg-slate-100 px-3 py-1 text-sm font-black text-slate-700 transition hover:bg-slate-200 active:scale-[0.98]"
          >
            시험 미등록
          </button>
        ) : null}
      </div>

      <div className="mb-3 grid w-full max-w-md grid-cols-3 gap-2 rounded-xl border border-slate-200 bg-white/90 p-1.5 shadow-[0_8px_24px_rgba(59,130,246,0.06)]">
        {(hasTarget || noExamMode) && (
          <button
            onClick={() => setViewMode("dashboard")}
            className={`min-h-[46px] rounded-lg px-3 text-sm font-bold transition ${
              viewMode === "dashboard"
                ? "bg-blue-600 text-white shadow-[0_8px_20px_rgba(37,99,235,0.28)]"
                : "bg-blue-50 text-blue-800"
            }`}
          >
            진단
          </button>
        )}
        <button
          onClick={() => setViewMode("study")}
          className={`min-h-[46px] rounded-lg px-3 text-sm font-bold transition ${
            viewMode === "study"
              ? "bg-emerald-600 text-white shadow-[0_8px_20px_rgba(5,150,105,0.28)]"
              : "bg-emerald-50 text-emerald-800"
          }`}
        >
          풀어보기
        </button>
        <button
          onClick={() => setViewMode("wrong_notes")}
          className={`min-h-[46px] rounded-lg px-3 text-sm font-bold transition ${
            viewMode === "wrong_notes"
              ? "bg-amber-500 text-white shadow-[0_8px_20px_rgba(217,119,6,0.28)]"
              : "bg-amber-50 text-amber-800"
          }`}
        >
          오답노트
        </button>
      </div>

      {viewMode === "wrong_notes" && (
        <div className="w-full max-w-md space-y-2">
          <div className="rounded-xl border border-white/70 bg-white/92 p-3 shadow-[0_12px_30px_rgba(15,23,42,0.06)]">
            <div className="mb-2 text-sm font-bold text-slate-800">필터</div>
            <div className="grid grid-cols-2 gap-2">
              <select
                value={wrongTypeFilter}
                onChange={(e) => setWrongTypeFilter(e.target.value)}
                className="h-10 rounded-lg border border-slate-200 bg-white px-3 text-sm font-semibold text-slate-800"
              >
                <option value="all">전체 유형</option>
                <option value="single">단일</option>
                <option value="passage">독해</option>
                <option value="grammar_context">문맥</option>
              </select>
              <select
                value={wrongStatusFilter}
                onChange={(e) => setWrongStatusFilter(e.target.value)}
                className="h-10 rounded-lg border border-slate-200 bg-white px-3 text-sm font-semibold text-slate-800"
              >
                <option value="all">전체 상태</option>
                <option value="open">미해결</option>
                <option value="resolved">해결됨</option>
              </select>
            </div>
            <button
              onClick={loadWrongAnswers}
              className="mt-2 min-h-[44px] w-full rounded-lg border border-blue-200 bg-blue-50 px-3 text-sm font-bold text-blue-700 transition active:scale-[0.99]"
            >
              새로고침
            </button>
          </div>

          {wrongAnswersLoading ? (
            <div className="rounded-[24px] border border-slate-200 bg-white p-4 text-base text-slate-700 shadow-[0_12px_35px_rgba(15,23,42,0.06)]">
              오답노트를 불러오는 중입니다...
            </div>
          ) : wrongAnswersError ? (
            <div className="rounded-[24px] border border-rose-200 bg-rose-50 p-4 text-base text-rose-700 shadow-[0_12px_35px_rgba(225,29,72,0.08)]">
              {wrongAnswersError}
            </div>
          ) : filteredWrongAnswers.length === 0 ? (
            <div className="rounded-[24px] border border-slate-200 bg-white p-4 text-base text-slate-700 shadow-[0_12px_35px_rgba(15,23,42,0.06)]">
              조건에 맞는 오답이 없습니다.
            </div>
          ) : (
            filteredWrongAnswers.map((item) => {
              const meta = getWrongQuestionMeta(item);
              const title = meta?.question || `문항 ID ${item.question_id}`;

              return (
                <div
                  key={item.id}
                  className="rounded-xl border border-white/70 bg-white/92 p-3 shadow-[0_12px_30px_rgba(15,23,42,0.06)]"
                >
                  <div className="mb-1.5 flex items-center justify-between gap-2">
                    <span className="inline-flex rounded-full bg-blue-50 px-2.5 py-1 text-xs font-bold text-blue-700">
                      {getWrongTypeLabel(item.question_type)}
                    </span>
                    <span
                      className={`inline-flex rounded-full px-2.5 py-1 text-xs font-bold ${
                        item.is_resolved ? "bg-emerald-50 text-emerald-700" : "bg-amber-50 text-amber-700"
                      }`}
                    >
                      {item.is_resolved ? "해결됨" : "미해결"}
                    </span>
                  </div>

                  <div className="mb-1.5 text-sm font-bold leading-6 text-slate-900">{title}</div>
                  <div className="mb-2 text-xs text-slate-600">
                    선택 답안: {item.selected_answer || "-"} | 기록일: {new Date(item.created_at).toLocaleString()}
                  </div>

                  <div className="grid grid-cols-2 gap-2">
                    <button
                      onClick={() => markWrongAnswerResolved(item.id)}
                      disabled={item.is_resolved}
                      className={`min-h-[44px] rounded-lg px-3 text-sm font-bold transition ${
                        item.is_resolved
                          ? "cursor-not-allowed border border-slate-200 bg-slate-100 text-slate-400"
                          : "border border-emerald-200 bg-emerald-50 text-emerald-700 active:scale-[0.99]"
                      }`}
                    >
                      해결 처리
                    </button>
                    <button
                      onClick={() => removeWrongAnswer(item.id)}
                      className="min-h-[44px] rounded-lg border border-rose-200 bg-rose-50 px-3 text-sm font-bold text-rose-700 transition active:scale-[0.99]"
                    >
                      삭제
                    </button>
                  </div>
                </div>
              );
            })
          )}
        </div>
      )}

      {viewMode === "dashboard" && (hasTarget || noExamMode) && (
        <div className="w-full max-w-md rounded-2xl border border-slate-200 bg-white/95 p-6 text-center shadow-[0_16px_40px_rgba(15,23,42,0.08)]">
          <p className="text-lg font-black text-slate-900">현재 준비중입니다</p>
        </div>
      )}

      {viewMode === "study" && (
      <div className="contents">

      {/* TYPE TAB */}
      <TypeTabs
        activeType={activeType}
        setActiveType={setActiveType}
        setActiveSubType={setActiveSubType}
      />

      {/* SUB TYPE */}
      {(activeType === "문자·어휘" || activeType === "문법" || activeType === "독해") && (
        <div className="mb-2.5 flex w-full max-w-md snap-x snap-mandatory gap-1.5 overflow-x-auto pb-0 [-ms-overflow-style:none] [scrollbar-width:none] [&::-webkit-scrollbar]:hidden">
          {(activeType === "문법"
            ? ["랜덤", "판단", "배열", "문맥"]
            : activeType === "독해"
              ? ["랜덤", "단문독해", "중문독해", "정보검색"]
              : ["랜덤", "한자 읽기", "표기", "문맥 규정"]
          ).map((sub) => (
            <button
              key={sub}
              onClick={() => setActiveSubType(sub)}
              className={`min-h-10 shrink-0 snap-start rounded-full border px-3 py-1.5 text-sm font-bold transition active:scale-[0.98] ${
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
        <div className="mb-2.5 w-full max-w-md rounded-xl border border-slate-200 bg-white px-3 py-3 text-[16px] leading-8 whitespace-pre-line shadow-[0_12px_30px_rgba(15,23,42,0.05)]">
          {normalizeMultilineText(passage?.content)}
        </div>
      )}

      {/* QUESTION CARD */}
      <div className="w-full max-w-md rounded-2xl border border-white/70 bg-white/92 p-3 shadow-[0_16px_40px_rgba(15,23,42,0.08)] backdrop-blur sm:p-4 mt-0">
        {isGrammarContext ? (
          <>
            <div className="mb-3 flex justify-between text-sm font-bold tracking-[0.06em] text-slate-500">
              <span>문맥</span>
              <span />
            </div>

            <div className="mb-3 rounded-xl border border-slate-200 bg-white px-3 py-3 text-[16px] leading-8 whitespace-pre-line text-slate-900 shadow-[0_8px_20px_rgba(15,23,42,0.04)] sm:px-3">
              {grammarContextLoading
                ? "데이터를 불러오는 중입니다..."
                : normalizeMultilineText(grammarContextContent) || "데이터 준비중입니다"}
            </div>

            {grammarContextLoading ? null : grammarContextQuestions.length > 0 ? (
              <div className="space-y-3">
                {grammarContextQuestions.map((item) => (
                  <div key={item.id} className="rounded-xl border border-slate-200 bg-white px-3 py-2 shadow-[0_8px_20px_rgba(15,23,42,0.04)]">
                    <div className="mb-2 text-base font-black text-slate-900">
                      {item.blank_number}.
                    </div>
                    <div className="grid grid-cols-2 gap-1.5 text-sm">
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
                            className={`min-h-[52px] rounded-xl border px-3 py-2 text-left text-[15px] font-semibold leading-5 shadow-sm transition active:scale-[0.985] ${style}`}
                          >
                            {choice}
                          </button>
                        );
                      })}
                    </div>

                    {grammarSelections[item.id] && (
                      <div className="mt-2 rounded-lg bg-slate-50 px-3 py-2 text-sm leading-6 text-slate-700">
                        {grammarSelections[item.id].isCorrect ? "정답입니다. " : "오답입니다. "}
                        {item.explanation || "해설이 없습니다."}
                      </div>
                    )}
                  </div>
                ))}

                {allGrammarQuestionsAnswered && !grammarContextExhausted && (
                  <button
                    onClick={handleRetryGrammarContext}
                    className="min-h-[50px] w-full rounded-xl bg-blue-600 px-3 py-2 text-sm font-bold text-white shadow-[0_12px_30px_rgba(37,99,235,0.25)] transition active:scale-[0.99]"
                  >
                    또 풀어보기
                  </button>
                )}

                {allGrammarQuestionsAnswered && grammarContextExhausted && (
                  <button
                    onClick={handleRestartGrammarContext}
                    className="min-h-[50px] w-full rounded-xl border border-blue-200 bg-blue-50 px-3 py-2 text-center text-sm font-bold text-blue-700 transition active:scale-[0.99]"
                  >
                    준비된 모든 문제를 푸셨군요, 다시 해볼까요?
                  </button>
                )}
              </div>
            ) : (
              <div className="text-center pt-6 pb-4">
                <p className="text-gray-600 text-lg font-semibold">
                  {grammarContextExhausted ? "준비된 모든 문제를 푸셨군요, 다시 해볼까요?" : "데이터가 없습니다."}
                </p>
              </div>
            )}
          </>
        ) : q ? (
          <>
            {/* PROGRESS */}
            <div className="mb-3 flex justify-between text-sm font-bold tracking-[0.06em] text-slate-500">
              <span>{mode === "single" ? q.sub_type || q.type : passage?.sub_type || passage?.type || activeType}</span>
              <span>
                {mode === "single"
                  ? `${current + 1} / ${questions.length}`
                  : `${passageIndex + 1} / ${passages.length}`}
              </span>
            </div>

            {/* QUESTION */}
            <div className="mb-4 rounded-xl bg-slate-50 px-3 py-3 text-left text-[18px] font-black leading-8 text-slate-900 sm:text-[18px]">
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
                <span>{`${q.blank_number}. ${q.question || `빈칸 ${q.blank_number}`}`}</span>
              )}
            </div>

            {/* OPTIONS */}
            <div className="grid gap-2">
              {options.map((opt, i) => {
                let style = "border-slate-200 bg-white text-slate-800";

                if (showExplanation) {
                  if (i + 1 === q.answer) style = "border-emerald-400 bg-emerald-50 text-emerald-900";
                  else if (selected === i) style = "border-rose-400 bg-rose-50 text-rose-900";
                }

                return (
                  <button
                    key={i}
                    onClick={async () => {
                      if (showExplanation) return;

                      setSelected(i);
                      setShowExplanation(true);

                      if (i + 1 === q.answer) {
                        setScore((s) => s + 1);
                      } else {
                        await saveWrongAnswer({
                          questionId: q.id,
                          questionType: mode === "passage" ? "passage" : "single",
                          selectedAnswer: i + 1,
                        });
                      }
                    }}
                    className={`min-h-[56px] rounded-xl border px-3 py-2.5 text-left shadow-sm transition active:scale-[0.985] ${style}`}
                  >
                    <div className="flex items-start gap-2.5">
                      <span className="mt-0.5 inline-flex h-6 w-6 shrink-0 items-center justify-center rounded-full bg-blue-50 text-xs font-bold text-blue-700">
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
              <div className="mt-3">
                <div className="mb-3 rounded-xl bg-slate-50 px-3 py-2 text-sm leading-6 text-slate-700">
                  💡 {q.explanation}
                </div>

                {isLastSingleQuestion ? (
                  <button
                    onClick={handleRetryCurrentSet}
                    className="min-h-[50px] w-full rounded-xl bg-blue-600 p-2.5 text-sm font-bold text-white shadow-[0_12px_30px_rgba(37,99,235,0.25)] transition active:scale-[0.99]"
                  >
                    5문항 Done! Try again?
                  </button>
                ) : (
                  <button
                    onClick={goNext}
                    className="min-h-[50px] w-full rounded-xl bg-blue-600 p-2.5 text-sm font-bold text-white shadow-[0_12px_30px_rgba(37,99,235,0.25)] transition active:scale-[0.99]"
                  >
                    다음
                  </button>
                )}
              </div>
            )}
          </>
        ) : (
          <div className="text-center pt-6 pb-4">
            <p className="text-gray-600 text-lg font-semibold">
              {activeType === "문법"
                ? "데이터 준비중입니다"
                : "해당 분류에 등록된 문제가 없습니다."}
            </p>
          </div>
        )}
      </div>
      </div>
      )}
      </div>
    </div>
  );
}

function TypeTabs({ activeType, setActiveType, setActiveSubType }) {
  const types = [
    { name: "문자·어휘" },
    { name: "문법" },
    { name: "독해" },
  ];

  return (
    <div className="grid w-full max-w-md grid-cols-3 gap-2">
      {types.map((type) => (
        <button
          key={type.name}
          onClick={() => {
            setActiveType(type.name);
            setActiveSubType("랜덤");
          }}
          className={`min-h-[48px] rounded-lg px-2 py-2 text-sm font-bold transition active:scale-[0.98] ${
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