import { useEffect, useState } from "react";
import { supabase } from "./supabase";

export function useUser() {
  const [userId, setUserId] = useState(null);
  const [userTarget, setUserTarget] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  const ensureUserRecord = async (currentUserId) => {
    const { data, error: selectError } = await supabase
      .from("users")
      .select("id")
      .eq("id", currentUserId)
      .maybeSingle();

    if (selectError) {
      throw selectError;
    }

    if (data) {
      return true;
    }

    const { error: insertError } = await supabase.from("users").insert({ id: currentUserId });

    if (insertError) {
      throw insertError;
    }

    return true;
  };

  // 사용자 ID 가져오기 또는 생성
  useEffect(() => {
    const initializeUser = async () => {
      try {
        // 1. 기존 인증 사용자 확인
        const { data: { user: authUser } } = await supabase.auth.getUser();
        let currentUserId = authUser?.id;

        // 2. 없으면 익명 로그인
        if (!currentUserId) {
          const { data, error: anonError } = await supabase.auth.signInAnonymously();
          if (anonError || !data?.user?.id) {
            setError("인증 실패");
            setLoading(false);
            return;
          }
          currentUserId = data.user.id;
        }

        setUserId(currentUserId);

        // 3. users 테이블에 레코드 보장
        await ensureUserRecord(currentUserId);

        // 4. user_targets 조회
        const { data: targets, error: targetError } = await supabase
          .from("user_targets")
          .select("*")
          .eq("user_id", currentUserId)
          .maybeSingle();

        if (targetError) {
          throw targetError;
        }

        setUserTarget(targets || null);
        setLoading(false);
      } catch (err) {
        console.error("User initialization error:", err);
        setError(err.message);
        setLoading(false);
      }
    };

    initializeUser();
  }, []);

  // 시험일 설정 함수
  const setGoal = async (examDate, goalScore = 70) => {
    if (!userId) return false;

    try {
      await ensureUserRecord(userId);

      const { data, error } = await supabase
        .from("user_targets")
        .upsert({
          user_id: userId,
          exam_date: examDate,
          goal_score: goalScore,
          current_estimated_score: 30, // 초기값
        }, {
          onConflict: "user_id",
        })
        .select()
        .single();

      if (error) throw error;

      setUserTarget(data);
      setError(null);
      return true;
    } catch (err) {
      console.error("Failed to set goal:", err);
      setError(err.message || "시험일 저장 중 오류가 발생했습니다.");
      return false;
    }
  };

  const clearGoal = async () => {
    if (!userId) return false;

    try {
      const { error } = await supabase.from("user_targets").delete().eq("user_id", userId);

      if (error) throw error;

      setUserTarget(null);
      setError(null);
      return true;
    } catch (err) {
      console.error("Failed to clear goal:", err);
      setError(err.message || "시험일 초기화 중 오류가 발생했습니다.");
      return false;
    }
  };

  return {
    userId,
    userTarget,
    loading,
    error,
    setGoal,
    clearGoal,
    hasTarget: !!userTarget,
  };
}
