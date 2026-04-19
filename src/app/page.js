
"use client";
import { useEffect, useRef, useState } from "react";
import { supabase } from "@/lib/supabase";
import { useUser } from "@/lib/useUser";
import Onboarding from "@/components/Onboarding";

const DASHBOARD_PRIORITY_WEIGHTS = {
  weakness: 1.0,
  drop: 0.6,
  lowAccuracyVolume: 0.08,
};

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
  const previousMainViewRef = useRef("study");
  const questionCacheRef = useRef(new Map());
  const passageCacheRef = useRef(new Map());
  const grammarContextCacheRef = useRef(new Map());
  const wrongAnswerAuthUnavailableRef = useRef(false);
  const attemptMetaRpcUnavailableRef = useRef(false);
  const skillRecommendationRpcUnavailableRef = useRef(false);
  const [wrongAnswers, setWrongAnswers] = useState([]);
  const [wrongAnswersLoading, setWrongAnswersLoading] = useState(false);
  const [wrongAnswersError, setWrongAnswersError] = useState("");
  const [wrongTypeFilter, setWrongTypeFilter] = useState("all");
  const [wrongStatusFilter, setWrongStatusFilter] = useState("all");
  const [wrongQuestionMetaMap, setWrongQuestionMetaMap] = useState({});
  const [dashboardLoading, setDashboardLoading] = useState(false);
  const [dashboardError, setDashboardError] = useState("");
  const [dashboardNotice, setDashboardNotice] = useState("");
  const [dashboardResetting, setDashboardResetting] = useState(false);
  const [dashboardStats, setDashboardStats] = useState({
    attempts: 0,
    correct: 0,
    accuracy: 0,
  });
  const [dashboardDetailStats, setDashboardDetailStats] = useState([]);
  const [dashboardMajorStats, setDashboardMajorStats] = useState([]);
  const [recommendPreviewLoading, setRecommendPreviewLoading] = useState(false);
  const [recommendPreviewError, setRecommendPreviewError] = useState("");
  const [recommendPreviewItems, setRecommendPreviewItems] = useState([]);
  const [recommendDifficultyDist, setRecommendDifficultyDist] = useState([]);
  const [studyFocus, setStudyFocus] = useState(null);
  const [focusedQuestionIds, setFocusedQuestionIds] = useState([]);
  const [focusedQuestionOrder, setFocusedQuestionOrder] = useState([]);

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
    const returnView = hasTarget ? previousMainViewRef.current || "study" : "study";
    const success = await setGoal(examDate);
    if (success) {
      if (typeof window !== "undefined") {
        localStorage.removeItem("noExamMode");
      }
      setNoExamMode(false);
      setViewMode(returnView);
    }
    return success;
  };

  // onboarding 취소
  const handleOnboardingCancel = () => {
    setViewMode(previousMainViewRef.current || "study");
  };

  const openEntryFromCurrentView = () => {
    if (viewMode === "study" || viewMode === "dashboard" || viewMode === "wrong_notes") {
      previousMainViewRef.current = viewMode;
    }
    setViewMode("entry");
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

  useEffect(() => {
    if (viewMode === "study" || viewMode === "dashboard" || viewMode === "wrong_notes") {
      previousMainViewRef.current = viewMode;
    }
  }, [viewMode]);

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
    const numericAnswer = Number(q.answer);
    const correct =
      Number.isInteger(numericAnswer) && numericAnswer >= 1 && numericAnswer <= 4
        ? opts[numericAnswer - 1]
        : String(q.answer || "").trim();
    const shuffled = shuffleArray(opts);
    const newAnswer =
      shuffled.findIndex((opt) => String(opt || "").trim() === String(correct || "").trim()) + 1;

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

  const resolveAttemptMeta = async ({ questionType, questionId, majorType, subType, skillKey }) => {
    if (attemptMetaRpcUnavailableRef.current) {
      return {
        majorType: majorType || null,
        subType: subType || null,
        skillKey: skillKey || null,
      };
    }

    const { data, error } = await supabase.rpc("get_question_meta_for_attempt", {
      p_question_type: questionType,
      p_question_id: String(questionId),
    });

    if (error) {
      // PostgREST function cache miss (PGRST202) and undefined function (42883)
      // both mean this RPC is unavailable in the current DB.
      if (error.code === "42883" || error.code === "PGRST202") {
        attemptMetaRpcUnavailableRef.current = true;
      }

      console.warn("Attempt meta RPC failed, using local fallback", error);
      return {
        majorType: majorType || null,
        subType: subType || null,
        skillKey: skillKey || null,
      };
    }

    const meta = Array.isArray(data) ? data[0] : data;

    return {
      majorType: meta?.major_type || majorType || null,
      subType: meta?.sub_type || subType || null,
      skillKey: meta?.skill_key || skillKey || null,
    };
  };

  const saveAttempt = async ({
    questionId,
    questionType,
    selectedAnswer,
    correctAnswer,
    isCorrect,
    majorType,
    subType,
    skillKey = null,
  }) => {
    if (!questionId || !questionType) {
      return;
    }

    try {
      const userId = await getWrongAnswerUserId();

      if (!userId) {
        return;
      }

      const resolvedMeta = await resolveAttemptMeta({
        questionType,
        questionId,
        majorType,
        subType,
        skillKey,
      });

      const fullPayload = {
        user_id: userId,
        question_id: String(questionId),
        question_type: questionType,
        selected_answer: selectedAnswer ?? null,
        correct_answer: correctAnswer ?? null,
        is_correct: Boolean(isCorrect),
        major_type: resolvedMeta.majorType,
        sub_type: resolvedMeta.subType,
        skill_key: resolvedMeta.skillKey,
        attempted_at: new Date().toISOString(),
      };

      let { error } = await supabase.from("user_question_attempts").insert(fullPayload);

      if (error && (error.code === "42703" || error.code === "23502" || error.code === "22P02")) {
        const fallbackPayload = {
          user_id: userId,
          question_id: String(questionId),
          question_type: questionType,
          selected_answer: selectedAnswer ?? null,
          correct_answer: correctAnswer ?? null,
          is_correct: Boolean(isCorrect),
        };

        const fallbackResult = await supabase.from("user_question_attempts").insert(fallbackPayload);
        error = fallbackResult.error;

        if (!error) {
          console.warn("saveAttempt: fallback insert succeeded. Check user_question_attempts schema sync.");
          return;
        }
      }

      if (error) {
        console.error("Failed to save attempt", {
          code: error.code,
          message: error.message,
          details: error.details,
          hint: error.hint,
        });
      }
    } catch (error) {
      console.error("Failed to save attempt", error);
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

  const dedupeRecommendationRows = (rows) => {
    const map = new Map();
    for (const row of rows || []) {
      if (!row?.question_id) continue;
      const key = `${row.question_type || "single"}::${row.question_id}`;
      const prev = map.get(key);
      if (!prev || Number(row.recommendation_score || 0) > Number(prev.recommendation_score || 0)) {
        map.set(key, row);
      }
    }
    return Array.from(map.values());
  };

  const loadRecommendationPreview = async (userId) => {
    setRecommendPreviewLoading(true);
    setRecommendPreviewError("");

    try {
      const { data, error } = await supabase.rpc("get_recommended_questions_by_skill_v3", {
        p_user_id: userId,
        p_major_type: null,
        p_sub_type: null,
        p_skill_key: null,
        p_limit: 30,
      });

      if (error) {
        throw error;
      }

      const rows = data || [];
      const dedupedRows = dedupeRecommendationRows(rows);

      setRecommendPreviewItems(dedupedRows.slice(0, 5));

      const distMap = dedupedRows.reduce((acc, row) => {
        const key = Number(row.difficulty || 3);
        acc[key] = (acc[key] || 0) + 1;
        return acc;
      }, {});

      const dist = Object.entries(distMap)
        .map(([difficulty, count]) => ({
          difficulty: Number(difficulty),
          count,
        }))
        .sort((a, b) => a.difficulty - b.difficulty);

      setRecommendDifficultyDist(dist);
    } catch (error) {
      console.error("Failed to load recommendation preview", error);
      setRecommendPreviewItems([]);
      setRecommendDifficultyDist([]);
      setRecommendPreviewError("추천 엔진 미리보기를 불러오지 못했습니다.");
    }

    setRecommendPreviewLoading(false);
  };

  const loadDashboardData = async () => {
    setDashboardLoading(true);
    setDashboardError("");
    setDashboardNotice("");

    try {
      const userId = await getWrongAnswerUserId();

      if (!userId) {
        setDashboardStats({ attempts: 0, correct: 0, accuracy: 0 });
        setDashboardDetailStats([]);
        setRecommendPreviewItems([]);
        setRecommendDifficultyDist([]);
        setDashboardError("로그인 세션을 확인할 수 없어 진단 정보를 불러오지 못했습니다.");
        setDashboardLoading(false);
        return;
      }

      // user_stats 집계 테이블 조회 (전체 스캔 없음)
      const { data: statsRows, error: statsError } = await supabase
        .from("user_stats")
        .select("major_type, sub_type, attempts, correct, weakness_score, last_attempted_at")
        .eq("user_id", userId);

      if (statsError) {
        throw statsError;
      }

      const nowMs = Date.now();
      const sevenDaysAgoIso = new Date(nowMs - 7 * 24 * 60 * 60 * 1000).toISOString();
      const fourteenDaysAgoIso = new Date(nowMs - 14 * 24 * 60 * 60 * 1000).toISOString();
      const { data: recentAttemptRows, error: recentAttemptError } = await supabase
        .from("user_question_attempts")
        .select("major_type, sub_type, is_correct, attempted_at")
        .eq("user_id", userId)
        .gte("attempted_at", fourteenDaysAgoIso);

      if (recentAttemptError) {
        throw recentAttemptError;
      }

      const rows = statsRows || [];
      const recentRows = recentAttemptRows || [];

      const recentByTypeMap = recentRows.reduce((acc, row) => {
        const majorType = row.major_type || "미분류";
        const subType = row.sub_type || "랜덤";
        const key = `${majorType}::${subType}`;
        const attemptedAtMs = row.attempted_at ? new Date(row.attempted_at).getTime() : 0;
        const isRecentWeek = attemptedAtMs >= new Date(sevenDaysAgoIso).getTime();
        const bucket = isRecentWeek ? "currentWeek" : "prevWeek";

        if (!acc[key]) {
          acc[key] = {
            currentWeek: { attempts: 0, correct: 0 },
            prevWeek: { attempts: 0, correct: 0 },
          };
        }

        acc[key][bucket].attempts += 1;
        if (row.is_correct) {
          acc[key][bucket].correct += 1;
        }

        return acc;
      }, {});

      // unique(user_id, major_type, sub_type, skill_key)에서 skill_key=null 중복이 허용될 수 있어
      // major/sub 기준으로 합산 집계해 대시보드 왜곡을 방지한다.
      const groupedStatsMap = rows.reduce((acc, row) => {
        const majorType = row.major_type || "미분류";
        const subType = row.sub_type || "랜덤";
        const key = `${majorType}::${subType}`;

        if (!acc[key]) {
          acc[key] = {
            majorType,
            subType,
            attempts: 0,
            correct: 0,
            weightedWeakness: 0,
            lastAttemptedAt: null,
          };
        }

        const attempts = Number(row.attempts || 0);
        const correct = Number(row.correct || 0);
        const weaknessScore = Number(row.weakness_score || 0);
        const prevLast = acc[key].lastAttemptedAt ? new Date(acc[key].lastAttemptedAt).getTime() : 0;
        const nextLast = row.last_attempted_at ? new Date(row.last_attempted_at).getTime() : 0;

        acc[key].attempts += attempts;
        acc[key].correct += correct;
        acc[key].weightedWeakness += weaknessScore * Math.max(attempts, 1);
        acc[key].lastAttemptedAt = nextLast > prevLast ? row.last_attempted_at : acc[key].lastAttemptedAt;

        return acc;
      }, {});

      const groupedRows = Object.values(groupedStatsMap).map((item) => {
        const attempts = item.attempts;
        const correct = item.correct;
        const weaknessDenominator = Math.max(attempts, 1);
        const normalizedWeakness = item.weightedWeakness / weaknessDenominator;
        const overallAccuracy = attempts > 0 ? Math.round((correct / attempts) * 100) : 0;
        const recentKey = `${item.majorType}::${item.subType}`;
        const recentStats =
          recentByTypeMap[recentKey] || {
            currentWeek: { attempts: 0, correct: 0 },
            prevWeek: { attempts: 0, correct: 0 },
          };
        const currentWeekAccuracy =
          recentStats.currentWeek.attempts > 0
            ? Math.round((recentStats.currentWeek.correct / recentStats.currentWeek.attempts) * 100)
            : null;
        const prevWeekAccuracy =
          recentStats.prevWeek.attempts > 0
            ? Math.round((recentStats.prevWeek.correct / recentStats.prevWeek.attempts) * 100)
            : null;
        const weekDelta =
          currentWeekAccuracy !== null && prevWeekAccuracy !== null
            ? currentWeekAccuracy - prevWeekAccuracy
            : null;
        const trendVolume = recentStats.currentWeek.attempts + recentStats.prevWeek.attempts;
        const trendConfidence = Math.min(1, trendVolume / 10);
        const dropPenalty =
          weekDelta !== null && weekDelta < 0
            ? (Math.abs(weekDelta) / 100) * trendConfidence
            : 0;
        const lowAccuracyVolumeBoost =
          attempts >= 8 && overallAccuracy < 70
            ? ((70 - overallAccuracy) / 100) * Math.min(1, attempts / 20)
            : 0;
        const priorityScore = Number.isFinite(normalizedWeakness)
          ? Number(
              (
                normalizedWeakness * DASHBOARD_PRIORITY_WEIGHTS.weakness +
                dropPenalty * DASHBOARD_PRIORITY_WEIGHTS.drop +
                lowAccuracyVolumeBoost * DASHBOARD_PRIORITY_WEIGHTS.lowAccuracyVolume
              ).toFixed(4)
            )
          : 0;

        return {
          majorType: item.majorType,
          subType: item.subType,
          attempts,
          correct,
          accuracy: overallAccuracy,
          weaknessScore: Number.isFinite(normalizedWeakness) ? normalizedWeakness : 0,
          lastAttemptedAt: item.lastAttemptedAt,
          currentWeekAttempts: recentStats.currentWeek.attempts,
          currentWeekCorrect: recentStats.currentWeek.correct,
          currentWeekAccuracy,
          prevWeekAttempts: recentStats.prevWeek.attempts,
          prevWeekCorrect: recentStats.prevWeek.correct,
          prevWeekAccuracy,
          weekDelta,
          priorityScore,
        };
      });

      const totalAttempts = groupedRows.reduce((s, r) => s + (r.attempts || 0), 0);
      const correctAttempts = groupedRows.reduce((s, r) => s + (r.correct || 0), 0);
      const accuracy = totalAttempts > 0 ? Math.round((correctAttempts / totalAttempts) * 100) : 0;

      setDashboardStats({ attempts: totalAttempts, correct: correctAttempts, accuracy });

      const detailStats = groupedRows
        .filter((r) => r.majorType !== "미분류")
        .sort((a, b) => b.priorityScore - a.priorityScore || b.weaknessScore - a.weaknessScore || b.attempts - a.attempts);

      setDashboardDetailStats(detailStats);

      const majorStats = Object.values(
        detailStats.reduce((acc, item) => {
          if (!acc[item.majorType]) {
            acc[item.majorType] = {
              majorType: item.majorType,
              attempts: 0,
              correct: 0,
              weightedWeakness: 0,
            };
          }

          acc[item.majorType].attempts += item.attempts;
          acc[item.majorType].correct += item.correct;
          acc[item.majorType].weightedWeakness += item.weaknessScore * Math.max(item.attempts, 1);

          return acc;
        }, {})
      )
        .map((item) => ({
          majorType: item.majorType,
          attempts: item.attempts,
          accuracy: item.attempts > 0 ? Math.round((item.correct / item.attempts) * 100) : 0,
          weaknessScore: item.attempts > 0 ? item.weightedWeakness / item.attempts : 0,
        }))
        .sort((a, b) => b.weaknessScore - a.weaknessScore);

      setDashboardMajorStats(majorStats);
      await loadRecommendationPreview(userId);
    } catch (error) {
      console.error("Failed to load dashboard data", error);
      setDashboardStats({ attempts: 0, correct: 0, accuracy: 0 });
      setDashboardDetailStats([]);
      setDashboardMajorStats([]);
      setRecommendPreviewItems([]);
      setRecommendDifficultyDist([]);
      setDashboardError("진단 데이터를 불러오는 중 오류가 발생했습니다.");
    }

    setDashboardLoading(false);
  };

  const resetDashboardData = async () => {
    const proceed = typeof window === "undefined" ? true : window.confirm("진단 기록을 초기화할까요? (시도 데이터가 삭제됩니다)");
    if (!proceed) return;

    setDashboardResetting(true);
    setDashboardError("");
    setDashboardNotice("");

    const runLegacyReset = async (userId) => {
      const { count: beforeAttemptCount, error: beforeAttemptError } = await supabase
        .from("user_question_attempts")
        .select("id", { count: "exact", head: true })
        .eq("user_id", userId);

      if (beforeAttemptError) {
        throw beforeAttemptError;
      }

      const { count: beforeStatsCount, error: beforeStatsError } = await supabase
        .from("user_stats")
        .select("id", { count: "exact", head: true })
        .eq("user_id", userId);

      if (beforeStatsError) {
        throw beforeStatsError;
      }

      const [{ error: deleteAttemptError }, { error: deleteStatsError }] = await Promise.all([
        supabase.from("user_question_attempts").delete().eq("user_id", userId),
        supabase.from("user_stats").delete().eq("user_id", userId),
      ]);

      if (deleteAttemptError) {
        throw deleteAttemptError;
      }

      if (deleteStatsError) {
        throw deleteStatsError;
      }

      const { count: afterAttemptCount, error: afterAttemptError } = await supabase
        .from("user_question_attempts")
        .select("id", { count: "exact", head: true })
        .eq("user_id", userId);

      if (afterAttemptError) {
        throw afterAttemptError;
      }

      const { count: afterStatsCount, error: afterStatsError } = await supabase
        .from("user_stats")
        .select("id", { count: "exact", head: true })
        .eq("user_id", userId);

      if (afterStatsError) {
        throw afterStatsError;
      }

      return {
        beforeAttemptCount: beforeAttemptCount || 0,
        beforeStatsCount: beforeStatsCount || 0,
        deletedAttempts: Math.max((beforeAttemptCount || 0) - (afterAttemptCount || 0), 0),
        deletedStats: Math.max((beforeStatsCount || 0) - (afterStatsCount || 0), 0),
        afterAttemptCount: afterAttemptCount || 0,
        afterStatsCount: afterStatsCount || 0,
      };
    };

    try {
      const userId = await getWrongAnswerUserId();

      if (!userId) {
        setDashboardError("로그인 세션을 확인할 수 없어 초기화를 진행할 수 없습니다.");
        setDashboardResetting(false);
        return;
      }

      let summary = null;
      const { data: resetData, error: resetError } = await supabase.rpc("reset_user_learning_data", {
        p_user_id: userId,
      });

      if (resetError) {
        if (resetError.code === "42883" || resetError.code === "PGRST202") {
          console.warn("reset_user_learning_data RPC not found, using legacy reset flow.");
          summary = await runLegacyReset(userId);
        } else {
          throw resetError;
        }
      } else {
        const firstRow = Array.isArray(resetData) ? resetData[0] : resetData;
        summary = {
          beforeAttemptCount: Number(firstRow?.before_attempts || 0),
          beforeStatsCount: Number(firstRow?.before_stats || 0),
          deletedAttempts: Number(firstRow?.deleted_attempts || 0),
          deletedStats: Number(firstRow?.deleted_stats || 0),
          afterAttemptCount: Number(firstRow?.after_attempts || 0),
          afterStatsCount: Number(firstRow?.after_stats || 0),
        };
      }

      const beforeTotal = (summary?.beforeAttemptCount || 0) + (summary?.beforeStatsCount || 0);
      const afterTotal = (summary?.afterAttemptCount || 0) + (summary?.afterStatsCount || 0);

      if (beforeTotal > 0 && afterTotal >= beforeTotal) {
        setDashboardError("초기화 권한이 없어 데이터가 삭제되지 않았습니다. RLS delete 정책을 확인해 주세요.");
        setDashboardResetting(false);
        return;
      }

      const totalDeleted = (summary?.deletedAttempts || 0) + (summary?.deletedStats || 0);
      setDashboardNotice(
        totalDeleted > 0
          ? `초기화 완료: 시도 ${summary?.deletedAttempts || 0}건, 집계 ${summary?.deletedStats || 0}건 삭제`
          : "삭제할 진단 기록이 없습니다."
      );

      await loadDashboardData();
    } catch (error) {
      console.error("Failed to reset dashboard data", error);
      setDashboardError("진단 기록 초기화 중 오류가 발생했습니다.");
    }

    setDashboardResetting(false);
  };

  useEffect(() => {
    setMode(activeType === "독해" ? "passage" : "single");
  }, [activeType]);

  const clearStudyFocus = () => {
    setStudyFocus(null);
    setFocusedQuestionIds([]);
    setFocusedQuestionOrder([]);
  };

  const handleTypeSelect = (nextType) => {
    clearStudyFocus();
    setActiveType(nextType);
  };

  const handleSubTypeSelect = (nextSubType) => {
    clearStudyFocus();
    setActiveSubType(nextSubType);
  };

  const getAllowedSubTypesByMajor = (majorType) => {
    if (majorType === "문자·어휘") return ["랜덤", "한자 읽기", "표기", "문맥 규정"];
    if (majorType === "문법") return ["랜덤", "판단", "배열", "문맥"];
    if (majorType === "독해") return ["랜덤", "단문독해", "중문독해", "정보검색"];
    return ["랜덤"];
  };

  const preloadFocusedRecommendations = async ({ majorType, subType, skillKey }) => {
    if (skillRecommendationRpcUnavailableRef.current) {
      setFocusedQuestionIds([]);
      setFocusedQuestionOrder([]);
      return;
    }

    try {
      const userId = await getWrongAnswerUserId();
      if (!userId) {
        setFocusedQuestionIds([]);
        setFocusedQuestionOrder([]);
        return;
      }

      const { data, error } = await supabase.rpc("get_recommended_questions_by_skill_v3", {
        p_user_id: userId,
        p_major_type: majorType,
        p_sub_type: subType,
        p_skill_key: skillKey || null,
        p_limit: 20,
      });

      if (error) {
        if (error.code === "42883") {
          skillRecommendationRpcUnavailableRef.current = true;
        }
        setFocusedQuestionIds([]);
        setFocusedQuestionOrder([]);
        return;
      }

      const recommendedIds = (data || [])
        .filter((item) => (item.question_type || "single") === "single" && item.question_id)
        .map((item) => String(item.question_id));

      setFocusedQuestionIds(recommendedIds);
      setFocusedQuestionOrder(recommendedIds);
    } catch (error) {
      console.warn("Focused recommendation preload failed", error);
      setFocusedQuestionIds([]);
      setFocusedQuestionOrder([]);
    }
  };

  const moveToRecommendedStudy = async (recommendation) => {
    const nextMajor = recommendation?.major_type || activeType;
    const allowedSubTypes = getAllowedSubTypesByMajor(nextMajor);
    const requestedSub = recommendation?.sub_type || "랜덤";
    const nextSub = allowedSubTypes.includes(requestedSub) ? requestedSub : "랜덤";

    setStudyFocus({
      majorType: nextMajor,
      subType: nextSub,
      skillLabel: recommendation?.skill_name || recommendation?.skill_key || null,
    });

    setActiveType(nextMajor);
    setActiveSubType(nextSub);
    await preloadFocusedRecommendations({
      majorType: nextMajor,
      subType: nextSub,
      skillKey: recommendation?.skill_key || null,
    });
    setRetryNonce((n) => n + 1);
    setViewMode("study");
  };

  const dedupeDashboardStats = (rows) => {
    const map = new Map();
    for (const row of rows || []) {
      const key = `${row.majorType}::${row.subType}`;
      const prev = map.get(key);
      if (!prev || (row.priorityScore ?? 0) > (prev.priorityScore ?? 0)) {
        map.set(key, row);
      }
    }
    return Array.from(map.values());
  };

  const moveToRecommendedByMajor = async (majorType) => {
    const target = dedupeDashboardStats(dashboardDetailStats)
      .filter((item) => item.majorType === majorType)
      .sort((a, b) => b.weaknessScore - a.weaknessScore || b.attempts - a.attempts)[0];

    if (target) {
      await moveToRecommendedStudy({
        major_type: target.majorType,
        sub_type: target.subType,
      });
      return;
    }

    const fallbackSubType = getAllowedSubTypesByMajor(majorType)[0] || "랜덤";
    await moveToRecommendedStudy({
      major_type: majorType,
      sub_type: fallbackSubType,
    });
  };

  const handleRecommendSummaryClick = async (majorType, subType) => {
    const target = (recommendPreviewItems || [])
      .filter((item) => (item.major_type || "미분류") === majorType && (item.sub_type || "랜덤") === subType)
      .sort((a, b) => Number(b.recommendation_score || 0) - Number(a.recommendation_score || 0))[0];

    await moveToRecommendedStudy({
      major_type: majorType,
      sub_type: subType,
      skill_key: target?.skill_key || null,
      skill_name: target?.skill_name || null,
    });
  };

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

  const getQuestionCorrectIndex = (item) => {
    if (!item) return -1;

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

  const handleGrammarOptionClick = async (item, idx) => {
    if (grammarSelections[item.id]) return;

    const correctIndex = getGrammarCorrectIndex(item);
    const isCorrect = idx === correctIndex;
    const correctAnswer = correctIndex >= 0 ? correctIndex + 1 : null;

    setGrammarSelections((prev) => ({
      ...prev,
      [item.id]: {
        selectedIdx: idx,
        isCorrect,
      },
    }));

    await saveAttempt({
      questionId: item.id,
      questionType: "grammar_context",
      selectedAnswer: idx + 1,
      correctAnswer,
      isCorrect,
      majorType: activeType,
      subType: activeSubType,
      skillKey: null,
    });

    if (!isCorrect) {
      await saveWrongAnswer({
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
          const focusedSet = new Set((focusedQuestionIds || []).map((id) => String(id)));
          const focusedRank = new Map((focusedQuestionOrder || []).map((id, idx) => [String(id), idx]));
          const focusedPool = focusedSet.size
            ? baseQuestions.filter((item) => focusedSet.has(String(item.id)))
            : [];
          const sortedFocusedPool = focusedPool.length
            ? [...focusedPool].sort(
                (a, b) =>
                  (focusedRank.get(String(a.id)) ?? Number.MAX_SAFE_INTEGER) -
                  (focusedRank.get(String(b.id)) ?? Number.MAX_SAFE_INTEGER)
              )
            : [];
          const fallbackPool = focusedSet.size
            ? baseQuestions.filter((item) => !focusedSet.has(String(item.id)))
            : baseQuestions;
          const candidateQuestions = sortedFocusedPool.length
            ? [...sortedFocusedPool, ...shuffleArray(fallbackPool)]
            : shuffleArray(fallbackPool);
          const processed = candidateQuestions
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
            .select("*")
            .eq("type", activeType);

          if (activeSubType !== "랜덤") {
            passagesQuery = passagesQuery.eq("sub_type", activeSubType);
          }

          const passagesResult = await passagesQuery;
          console.log("[DEBUG] passagesResult", passagesResult);

          if (!passagesResult.error && passagesResult.data) {
            const groupIds = [...new Set(passagesResult.data.map((item) => item.group_id).filter(Boolean))];
            let questionsQuery = supabase
              .from("passage_questions")
              .select("*")
              .in("group_id", groupIds)
              .eq("type", activeType)
              .order("blank_number", { ascending: true });

            if (activeSubType !== "랜덤") {
              questionsQuery = questionsQuery.eq("sub_type", activeSubType);
            }

            const { data: questionData } = groupIds.length
              ? await questionsQuery
              : { data: [] };
            console.log("[DEBUG] passage_questions data", questionData);

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
  }, [mode, activeType, activeSubType, retryNonce, viewMode, focusedQuestionIds, focusedQuestionOrder]);

  useEffect(() => {
    if (viewMode === "wrong_notes") {
      loadWrongAnswers();
    }
  }, [viewMode]);

  useEffect(() => {
    if (viewMode === "dashboard" && (hasTarget || noExamMode)) {
      loadDashboardData();
    }
  }, [viewMode, hasTarget, noExamMode]);

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
  const currentQuestionCorrectIndex = !isGrammarContext ? getQuestionCorrectIndex(q) : -1;
  const isCurrentAnswerCorrect =
    showExplanation && selected !== null && selected === currentQuestionCorrectIndex;
  const allGrammarQuestionsAnswered =
    grammarContextQuestions.length > 0 &&
    grammarContextQuestions.every((item) => Boolean(grammarSelections[item.id]));
  const dedupedDashboardDetailStats = dedupeDashboardStats(dashboardDetailStats)
    .sort((a, b) => b.priorityScore - a.priorityScore || b.weaknessScore - a.weaknessScore || b.attempts - a.attempts);

  const urgentDashboardItems = dedupedDashboardDetailStats
    .filter((item) => item.priorityScore >= 0.35 || (item.weekDelta ?? 0) <= -10)
    .slice(0, 3);

  const recommendTypeSubSummary = Object.values(
    (recommendPreviewItems || []).reduce((acc, item) => {
      const majorType = item.major_type || "미분류";
      const subType = item.sub_type || "랜덤";
      const key = `${majorType}::${subType}`;

      if (!acc[key]) {
        acc[key] = { majorType, subType, count: 0 };
      }

      acc[key].count += 1;
      return acc;
    }, {})
  )
    .sort((a, b) => b.count - a.count || a.majorType.localeCompare(b.majorType))
    .slice(0, 5);

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

      {/* TITLE + FEEDBACK BUTTON */}
      <div className="mb-3 flex w-full items-center justify-between rounded-2xl border border-white/70 bg-white/85 px-3 py-2 shadow-[0_10px_30px_rgba(37,99,235,0.08)] backdrop-blur whitespace-nowrap gap-2">
        <div className="flex items-center gap-2 min-w-0">
          <button
            onClick={() => { window.location.href = '/feedback'; }}
            className="rounded-full border border-amber-300 bg-amber-50 px-3 py-1 text-xs font-black text-amber-700 transition hover:bg-amber-100 active:scale-[0.98]"
            style={{ flexShrink: 0 }}
            aria-label="피드백 남기기"
          >
            피드백
          </button>
          <h1 className="text-[1.5rem] font-black tracking-[-0.02em] text-blue-700 sm:text-[1.6rem] min-w-0 truncate">
            🌸 나만의 JLPT 연습
          </h1>
        </div>
        {hasTarget ? (
          <button
            onClick={openEntryFromCurrentView}
            className="rounded-full border border-blue-200 bg-blue-50 px-3 py-1 text-sm font-black text-blue-700 transition hover:bg-blue-100 active:scale-[0.98]"
          >
            D-{Math.ceil((new Date(userTarget.exam_date) - new Date()) / (1000 * 60 * 60 * 24))}
          </button>
        ) : noExamMode ? (
          <button
            onClick={openEntryFromCurrentView}
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
        <div className="w-full max-w-md space-y-3">

          {/* 유형별 바로 풀기 */}
          <div className="rounded-xl border border-white/70 bg-white/92 p-3 shadow-[0_12px_30px_rgba(15,23,42,0.06)]">
            <div className="mb-2 text-sm font-black text-slate-900">유형별 바로 풀기</div>
            <div className="space-y-2">
              {[
                { major: "문자·어휘", subs: ["한자 읽기", "표기", "문맥 규정"], color: "blue" },
                { major: "문법", subs: ["판단", "배열", "문맥"], color: "violet" },
                { major: "독해", subs: ["단문독해", "중문독해", "정보검색"], color: "emerald" },
              ].map(({ major, subs, color }) => (
                <div key={major}>
                  <p className="mb-1 text-xs font-bold text-slate-500">{major}</p>
                  <div className="grid grid-cols-3 gap-1.5">
                    {subs.map((sub) => (
                      <button
                        key={sub}
                        onClick={() => {
                          setActiveType(major);
                          setActiveSubType(sub);
                          setStudyFocus(null);
                          setFocusedQuestionIds([]);
                          setFocusedQuestionOrder([]);
                          setRetryNonce((n) => n + 1);
                          setViewMode("study");
                        }}
                        className={`min-h-[40px] rounded-lg border px-2 py-1.5 text-xs font-bold transition active:scale-[0.97] ${
                          color === "blue"
                            ? "border-blue-200 bg-blue-50 text-blue-700 hover:bg-blue-100"
                            : color === "violet"
                            ? "border-violet-200 bg-violet-50 text-violet-700 hover:bg-violet-100"
                            : "border-emerald-200 bg-emerald-50 text-emerald-700 hover:bg-emerald-100"
                        }`}
                      >
                        {sub}
                      </button>
                    ))}
                  </div>
                </div>
              ))}
            </div>
          </div>

          <div className="rounded-xl border border-white/70 bg-white/92 p-3 shadow-[0_12px_30px_rgba(15,23,42,0.06)]">
            <div className="mb-2 flex items-center justify-between">
              <p className="text-sm font-black text-slate-900">학습 진단</p>
              <div className="flex items-center gap-1.5">
                <button
                  onClick={loadDashboardData}
                  className="min-h-[36px] rounded-lg border border-blue-200 bg-blue-50 px-3 text-xs font-bold text-blue-700 transition active:scale-[0.99]"
                >
                  새로고침
                </button>
                <button
                  onClick={resetDashboardData}
                  disabled={dashboardResetting}
                  className={`min-h-[36px] rounded-lg border px-3 text-xs font-bold transition active:scale-[0.99] ${
                    dashboardResetting
                      ? "cursor-not-allowed border-slate-200 bg-slate-100 text-slate-400"
                      : "border-rose-200 bg-rose-50 text-rose-700"
                  }`}
                >
                  {dashboardResetting ? "초기화 중" : "초기화"}
                </button>
              </div>
            </div>
            <p className="text-xs text-slate-600">
              누적된 학습 기록을 기준으로 내 학습 상태를 확인합니다.
            </p>
          </div>

          {dashboardLoading ? (
            <div className="rounded-[24px] border border-slate-200 bg-white p-4 text-base text-slate-700 shadow-[0_12px_35px_rgba(15,23,42,0.06)]">
              진단 데이터를 불러오는 중입니다...
            </div>
          ) : dashboardError ? (
            <div className="rounded-[24px] border border-rose-200 bg-rose-50 p-4 text-base text-rose-700 shadow-[0_12px_35px_rgba(225,29,72,0.08)]">
              {dashboardError}
            </div>
          ) : (
            <div className="space-y-2">

              {dashboardNotice ? (
                <div className="rounded-[24px] border border-emerald-200 bg-emerald-50 p-4 text-sm font-semibold text-emerald-700 shadow-[0_12px_35px_rgba(16,185,129,0.08)]">
                  {dashboardNotice}
                </div>
              ) : null}

              {/* 오늘의 취약 유형 TOP 3 */}
              {urgentDashboardItems.length > 0 && (
                <div className="rounded-xl border border-rose-200 bg-rose-50/60 p-3 shadow-[0_12px_30px_rgba(225,29,72,0.08)]">
                  <div className="mb-2 flex items-center gap-1.5">
                    <span className="text-sm font-black text-rose-700">⚠️ 지금 당장 풀어야 할 유형</span>
                  </div>
                  <div className="space-y-1.5">
                    {urgentDashboardItems.map((item, idx) => (
                      <button
                        key={`top-${item.majorType}:${item.subType}:${idx}`}
                        onClick={() => moveToRecommendedStudy({ major_type: item.majorType, sub_type: item.subType })}
                        className="flex w-full items-center justify-between rounded-lg border border-rose-200 bg-white px-3 py-2 text-left transition hover:bg-rose-50 active:scale-[0.99]"
                      >
                        <span className="text-sm font-bold text-slate-900">{item.majorType} · {item.subType}</span>
                        <div className="flex items-center gap-2">
                          <span className="text-xs text-slate-500">정답률 {item.accuracy}%</span>
                          <span className="rounded-full bg-rose-100 px-2 py-0.5 text-xs font-bold text-rose-700">
                            취약도 {(item.weaknessScore * 100).toFixed(0)}
                          </span>
                          <span className="rounded-full bg-slate-100 px-2 py-0.5 text-xs font-bold text-slate-600">
                            우선순위 {(item.priorityScore * 100).toFixed(0)}
                          </span>
                          <span className="text-xs font-bold text-rose-600">→ 풀기</span>
                        </div>
                      </button>
                    ))}
                  </div>
                </div>
              )}

              <div className="rounded-xl border border-white/70 bg-white/92 p-3 shadow-[0_12px_30px_rgba(15,23,42,0.06)]">
                <div className="mb-2 text-sm font-black text-slate-900">전체</div>
                <div className="grid grid-cols-3 gap-2">
                  <div className="rounded-lg border border-slate-200 bg-white px-2.5 py-2 text-center">
                    <p className="text-[11px] font-bold text-slate-500">내 시도</p>
                    <p className="mt-1 text-lg font-black text-slate-900">{dashboardStats.attempts}</p>
                  </div>
                  <div className="rounded-lg border border-slate-200 bg-white px-2.5 py-2 text-center">
                    <p className="text-[11px] font-bold text-slate-500">정답 건수</p>
                    <p className="mt-1 text-lg font-black text-emerald-700">{dashboardStats.correct}</p>
                  </div>
                  <div className="rounded-lg border border-slate-200 bg-white px-2.5 py-2 text-center">
                    <p className="text-[11px] font-bold text-slate-500">정답률</p>
                    <p className="mt-1 text-lg font-black text-blue-700">{dashboardStats.accuracy}%</p>
                  </div>
                </div>
              </div>

              <div className="rounded-xl border border-white/70 bg-white/92 p-3 shadow-[0_12px_30px_rgba(15,23,42,0.06)]">
                <div className="mb-2 flex items-center justify-between gap-2">
                  <div>
                    <p className="text-sm font-black text-slate-900">추천 엔진 미리보기</p>
                    <p className="text-[11px] text-slate-500">v3 추천 상위 결과와 난이도 분포</p>
                  </div>
                </div>

                {recommendPreviewLoading ? (
                  <p className="rounded-lg bg-slate-50 px-3 py-2 text-sm text-slate-600">추천 미리보기를 불러오는 중입니다...</p>
                ) : recommendPreviewError ? (
                  <p className="rounded-lg bg-rose-50 px-3 py-2 text-sm text-rose-700">{recommendPreviewError}</p>
                ) : (
                  <div className="space-y-2">
                    <div className="flex flex-wrap items-center gap-1.5">
                      {recommendDifficultyDist.length === 0 ? (
                        <span className="text-xs text-slate-500">추천 분포 데이터가 없습니다.</span>
                      ) : (
                        recommendDifficultyDist.map((d) => (
                          <span
                            key={`dist-${d.difficulty}`}
                            className="rounded-full border border-slate-200 bg-slate-50 px-2 py-1 text-xs font-bold text-slate-700"
                          >
                            난이도 {d.difficulty}: {d.count}
                          </span>
                        ))
                      )}
                    </div>

                    {recommendTypeSubSummary.length > 0 && (
                      <div className="flex flex-wrap items-center gap-1.5">
                        {recommendTypeSubSummary.map((item) => (
                          <button
                            key={`summary-${item.majorType}-${item.subType}`}
                            onClick={() => handleRecommendSummaryClick(item.majorType, item.subType)}
                            className="rounded-full border border-blue-200 bg-blue-50 px-2 py-1 text-xs font-bold text-blue-700 transition hover:bg-blue-100 active:scale-[0.99]"
                          >
                            {item.majorType} · {item.subType}: {item.count}
                          </button>
                        ))}
                      </div>
                    )}

                    {recommendPreviewItems.length === 0 ? (
                      <p className="rounded-lg bg-slate-50 px-3 py-2 text-sm text-slate-600">추천 결과가 아직 없습니다.</p>
                    ) : (
                      <div className="space-y-1.5">
                        {recommendPreviewItems.map((item) => (
                          <div key={`preview-${item.question_type || "single"}-${item.question_id}`} className="rounded-lg border border-slate-200 bg-white px-3 py-2">
                            <div className="flex items-center justify-between gap-2">
                              <p className="text-xs font-bold text-slate-900">{item.major_type} · {item.sub_type}</p>
                              <div className="flex items-center gap-1.5">
                                <span
                                  className={`rounded-full px-2 py-0.5 text-[11px] font-bold ${
                                    Number(item.difficulty || 3) >= 5
                                      ? "bg-rose-50 text-rose-700"
                                      : Number(item.difficulty || 3) === 4
                                      ? "bg-amber-50 text-amber-700"
                                      : Number(item.difficulty || 3) === 3
                                      ? "bg-blue-50 text-blue-700"
                                      : "bg-emerald-50 text-emerald-700"
                                  }`}
                                >
                                  난이도 {item.difficulty}
                                </span>
                                <span className="rounded-full bg-blue-50 px-2 py-0.5 text-[11px] font-bold text-blue-700">
                                  점수 {Number(item.recommendation_score || 0).toFixed(3)}
                                </span>
                              </div>
                            </div>
                            <p className="mt-1 text-[11px] text-slate-500">
                              {item.question_type} · 가중치 {Number(item.recommendation_weight || 1).toFixed(2)}
                            </p>
                            <button
                              onClick={() =>
                                moveToRecommendedStudy({
                                  major_type: item.major_type,
                                  sub_type: item.sub_type,
                                  skill_key: item.skill_key || null,
                                  skill_name: item.skill_name || null,
                                })
                              }
                              className="mt-2 w-full rounded-md border border-blue-200 bg-blue-50 px-2 py-1.5 text-xs font-bold text-blue-700 transition hover:bg-blue-100 active:scale-[0.99]"
                            >
                              이 추천으로 바로 풀기
                            </button>
                          </div>
                        ))}
                      </div>
                    )}
                  </div>
                )}
              </div>

              <div className="rounded-xl border border-white/70 bg-white/92 p-3 shadow-[0_12px_30px_rgba(15,23,42,0.06)]">
                <div className="mb-2 text-sm font-black text-slate-900">세부 지표</div>
                {dashboardDetailStats.length === 0 ? (
                  <p className="rounded-lg bg-slate-50 px-3 py-2 text-sm text-slate-600">
                    아직 세부 지표가 없습니다. 문제를 풀면 탭별 통계가 표시됩니다.
                  </p>
                ) : (
                  <div className="space-y-2">
                    {dashboardMajorStats.length > 0 && (
                      <div className="rounded-lg border border-slate-200 bg-slate-50 p-2.5">
                        <p className="mb-2 text-xs font-black text-slate-700">영역별 취약도</p>
                        <div className="space-y-2">
                          {dashboardMajorStats.map((item) => {
                            const majorColor =
                              item.majorType === "문자·어휘"
                                ? "bg-blue-400"
                                : item.majorType === "문법"
                                ? "bg-violet-400"
                                : "bg-emerald-400";
                            const majorLabelColor =
                              item.majorType === "문자·어휘"
                                ? "text-blue-700"
                                : item.majorType === "문법"
                                ? "text-violet-700"
                                : "text-emerald-700";

                            return (
                              <button
                                key={`major-${item.majorType}`}
                                onClick={() => moveToRecommendedByMajor(item.majorType)}
                                className="w-full rounded-md border border-transparent px-1 py-1 text-left transition hover:border-slate-200 hover:bg-white/70"
                              >
                                <div className="mb-1 flex items-center justify-between text-[11px] font-bold">
                                  <span className={majorLabelColor}>{item.majorType}</span>
                                  <span className="text-slate-600">정답률 {item.accuracy}% · 취약도 {(item.weaknessScore * 100).toFixed(0)} · 바로풀기</span>
                                </div>
                                <div className="h-1.5 overflow-hidden rounded-full bg-slate-200">
                                  <div
                                    className={`h-full rounded-full ${majorColor}`}
                                    style={{ width: `${Math.min(item.weaknessScore * 100, 100)}%` }}
                                  />
                                </div>
                              </button>
                            );
                          })}
                        </div>
                      </div>
                    )}

                    {dedupedDashboardDetailStats.map((item, idx) => {
                      // 취약도 등급: 0.6+ 위험 / 0.3+ 주의 / 그 외 양호
                      const isWeak   = item.weaknessScore >= 0.6;
                      const isMiddle = item.weaknessScore >= 0.3 && !isWeak;
                      const badgeColor = isWeak
                        ? "bg-rose-50 text-rose-700"
                        : isMiddle
                        ? "bg-amber-50 text-amber-700"
                        : "bg-emerald-50 text-emerald-700";
                      const weakLabel = isWeak ? "취약" : isMiddle ? "주의" : "양호";
                      return (
                      <div
                        key={`${item.majorType}:${item.subType}:${idx}`}
                        className={`rounded-lg border px-3 py-2 ${isWeak ? "border-rose-200 bg-rose-50/40" : "border-slate-200 bg-white"}`}
                      >
                        <div className="mb-1 flex items-center justify-between gap-2">
                          <p className="text-sm font-bold text-slate-900">{item.majorType} · {item.subType}</p>
                          <div className="flex items-center gap-1">
                            <span className="rounded-full bg-slate-100 px-2 py-0.5 text-xs font-bold text-slate-600">
                              우선순위 {(item.priorityScore * 100).toFixed(0)}
                            </span>
                            {item.currentWeekAttempts >= 3 && item.prevWeekAttempts >= 3 && item.weekDelta !== null ? (
                              <span
                                className={`rounded-full px-2 py-0.5 text-xs font-bold ${
                                  item.weekDelta >= 5
                                    ? "bg-emerald-50 text-emerald-700"
                                    : item.weekDelta <= -5
                                    ? "bg-rose-50 text-rose-700"
                                    : "bg-slate-100 text-slate-600"
                                }`}
                              >
                                전주대비 {item.weekDelta >= 5 ? "▲" : item.weekDelta <= -5 ? "▼" : "•"}
                                {item.weekDelta > 0 ? `+${item.weekDelta}` : item.weekDelta}%
                              </span>
                            ) : null}
                            <span className={`rounded-full px-2 py-0.5 text-xs font-bold ${badgeColor}`}>
                              {weakLabel}
                            </span>
                            <span className="rounded-full bg-slate-100 px-2 py-0.5 text-xs font-bold text-slate-600">
                              정답률 {item.accuracy}%
                            </span>
                          </div>
                        </div>
                        <div className="mb-1.5 flex items-center gap-2">
                          {/* 취약도 바 */}
                          <div className="h-1.5 flex-1 rounded-full bg-slate-100 overflow-hidden">
                            <div
                              className={`h-full rounded-full transition-all ${isWeak ? "bg-rose-400" : isMiddle ? "bg-amber-400" : "bg-emerald-400"}`}
                              style={{ width: `${Math.min(item.weaknessScore * 100, 100)}%` }}
                            />
                          </div>
                          <span className="text-[11px] text-slate-400">
                            취약도 {(item.weaknessScore * 100).toFixed(0)}
                          </span>
                        </div>
                        <p className="text-xs text-slate-600">내 시도 {item.attempts} · 정답 {item.correct}</p>
                        {item.currentWeekAttempts > 0 ? (
                          <p className="mt-1 text-[11px] text-slate-500">
                            최근 7일: {item.currentWeekAttempts}회 · 정답률 {item.currentWeekAccuracy}%
                            {item.prevWeekAttempts > 0 && item.prevWeekAccuracy !== null
                              ? ` · 이전 7일: ${item.prevWeekAttempts}회 · ${item.prevWeekAccuracy}%`
                              : ""}
                          </p>
                        ) : null}
                        <button
                          onClick={() =>
                            moveToRecommendedStudy({
                              major_type: item.majorType,
                              sub_type: item.subType,
                            })
                          }
                          className={`mt-2 w-full rounded-lg border px-3 py-2 text-xs font-bold transition active:scale-[0.99] ${
                            isWeak
                              ? "border-rose-200 bg-rose-50 text-rose-700 hover:bg-rose-100"
                              : "border-emerald-200 bg-emerald-50 text-emerald-700 hover:bg-emerald-100"
                          }`}
                        >
                          {isWeak ? "⚠️ 취약 유형 집중 풀기" : "이 유형 추천문제 풀기"}
                        </button>
                      </div>
                      );
                    })}
                  </div>
                )}
              </div>
            </div>
          )}
        </div>
      )}

      {viewMode === "study" && (
      <div className="contents">

      {/* TYPE TAB */}
      <TypeTabs
        activeType={activeType}
        setActiveType={handleTypeSelect}
        setActiveSubType={setActiveSubType}
      />

      {studyFocus && (
        <div className="mb-2.5 w-full max-w-md rounded-xl border border-emerald-200 bg-emerald-50 px-3 py-3 shadow-[0_10px_24px_rgba(16,185,129,0.12)]">
          <div className="flex items-start justify-between gap-2">
            <div>
              <p className="text-xs font-black tracking-[0.05em] text-emerald-700">이 약점 유형 집중 연습하기</p>
              <p className="mt-1 text-sm font-bold text-emerald-900">
                {studyFocus.majorType} · {studyFocus.subType} 추천문제 풀이 중
              </p>
              {studyFocus.skillLabel ? (
                <p className="mt-1 text-xs text-emerald-800">기준 스킬: {studyFocus.skillLabel}</p>
              ) : null}
            </div>
            <button
              onClick={clearStudyFocus}
              className="rounded-md border border-emerald-300 bg-white px-2 py-1 text-xs font-bold text-emerald-700 transition hover:bg-emerald-100"
            >
              종료
            </button>
          </div>
        </div>
      )}

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
              onClick={() => handleSubTypeSelect(sub)}
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
                let badgeStyle = "bg-blue-50 text-blue-700";

                if (showExplanation) {
                  if (i === currentQuestionCorrectIndex) {
                    style = "border-emerald-400 bg-emerald-50 text-emerald-900";
                    badgeStyle = "bg-emerald-100 text-emerald-800";
                  } else if (selected === i) {
                    style = "border-rose-400 bg-rose-50 text-rose-900";
                    badgeStyle = "bg-rose-100 text-rose-800";
                  }
                }

                return (
                  <button
                    key={i}
                    onClick={async () => {
                      if (showExplanation) return;

                      setSelected(i);
                      setShowExplanation(true);

                      const selectedAnswer = i + 1;
                      const correctAnswer =
                        currentQuestionCorrectIndex >= 0 ? currentQuestionCorrectIndex + 1 : null;
                      const isCorrect =
                        currentQuestionCorrectIndex >= 0 && i === currentQuestionCorrectIndex;

                      await saveAttempt({
                        questionId: q.id,
                        questionType: mode === "passage" ? "passage" : "single",
                        selectedAnswer,
                        correctAnswer,
                        isCorrect,
                        majorType: mode === "passage" ? passage?.type || activeType : q.type || activeType,
                        subType: mode === "passage" ? passage?.sub_type || activeSubType : q.sub_type || activeSubType,
                        skillKey: null,
                      });

                      if (isCorrect) {
                        setScore((s) => s + 1);
                      } else {
                        await saveWrongAnswer({
                          questionId: q.id,
                          questionType: mode === "passage" ? "passage" : "single",
                          selectedAnswer,
                        });
                      }
                    }}
                    className={`min-h-[56px] rounded-xl border px-3 py-2.5 text-left shadow-sm transition active:scale-[0.985] ${style}`}
                  >
                    <div className="flex items-start gap-2.5">
                      <span className={`mt-0.5 inline-flex h-6 w-6 shrink-0 items-center justify-center rounded-full text-xs font-bold ${badgeStyle}`}>
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
                <div
                  className={`mb-2 rounded-xl px-3 py-2 text-sm font-black ${
                    isCurrentAnswerCorrect
                      ? "bg-emerald-50 text-emerald-700"
                      : "bg-rose-50 text-rose-700"
                  }`}
                >
                  {isCurrentAnswerCorrect ? "정답입니다!" : "아쉽네요!"}
                </div>
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