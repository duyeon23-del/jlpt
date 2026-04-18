"use client";
import { useState } from "react";
import { supabase } from "@/lib/supabase";
import { useUser } from "@/lib/useUser";
import { useRouter } from "next/navigation";

export default function FeedbackPage() {
  const [feedback, setFeedback] = useState("");
  const [loading, setLoading] = useState(false);
  const [success, setSuccess] = useState(false);
  const [error, setError] = useState("");
  const { user } = useUser();
  const router = useRouter();

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    setError("");
    setSuccess(false);
    const { error } = await supabase.from("user_feedbacks").insert({
      user_id: user?.id || null,
      feedback_text: feedback,
    });
    setLoading(false);
    if (error) {
      setError("저장에 실패했습니다. 다시 시도해 주세요.");
    } else {
      setSuccess(true);
      setFeedback("");
      setTimeout(() => router.back(), 1200);
    }
  };

  return (
    <div className="min-h-screen flex flex-col items-center justify-center bg-gradient-to-b from-blue-50 to-white px-4 py-8">
      <div className="w-full max-w-md rounded-2xl border border-slate-200 bg-white/95 p-6 shadow-lg">
        <h1 className="text-xl font-black text-blue-700 mb-2">피드백/건의사항 남기기</h1>
        <form onSubmit={handleSubmit} className="space-y-4">
          <textarea
            className="w-full h-32 rounded-lg border border-slate-300 p-3 text-slate-900 font-semibold focus:outline-none focus:border-blue-500"
            placeholder="불편했던 점, 개선 아이디어, 버그 등 자유롭게 남겨주세요!"
            value={feedback}
            onChange={(e) => setFeedback(e.target.value)}
            required
            disabled={loading}
          />
          {error && <div className="text-rose-600 text-sm font-bold">{error}</div>}
          {success && <div className="text-emerald-700 text-sm font-bold">감사합니다! 곧 반영하겠습니다.</div>}
          <div className="flex gap-2">
            <button
              type="submit"
              disabled={loading || !feedback.trim()}
              className="flex-1 rounded-lg bg-blue-600 text-white font-bold py-2 transition hover:bg-blue-700 disabled:bg-blue-200"
            >
              {loading ? "저장 중..." : "저장하기"}
            </button>
            <button
              type="button"
              onClick={() => router.back()}
              className="flex-1 rounded-lg border border-slate-300 bg-white text-slate-700 font-bold py-2 transition hover:bg-slate-50"
              disabled={loading}
            >
              취소
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
