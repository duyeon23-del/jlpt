"use client";
import { useState } from "react";
import { supabase } from "@/lib/supabase";
import { useUser } from "@/lib/useUser";

export default function FeedbackPage() {
  const { user } = useUser();
  const [feedback, setFeedback] = useState("");
  const [status, setStatus] = useState("");
  const [loading, setLoading] = useState(false);

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!feedback.trim()) {
      setStatus("내용을 입력해 주세요.");
      return;
    }
    setLoading(true);
    setStatus("");
    const { error } = await supabase.from("feedbacks").insert({
      user_id: user?.id || null,
      feedback_text: feedback,
    });
    setLoading(false);
    if (error) {
      setStatus("저장에 실패했습니다. 다시 시도해 주세요.");
    } else {
      setStatus("피드백이 저장되었습니다. 감사합니다!");
      setFeedback("");
    }
  };

  return (
    <div className="min-h-screen flex flex-col items-center justify-center bg-gradient-to-b from-blue-50 to-white px-4 py-8">
      <div className="w-full max-w-md rounded-2xl border border-slate-200 bg-white/95 p-6 shadow-lg">
        <h1 className="text-xl font-black text-blue-700 mb-2">피드백 남기기</h1>
        <form onSubmit={handleSubmit} className="space-y-4">
          <textarea
            className="w-full h-32 rounded-lg border border-slate-300 px-3 py-2 text-slate-900 font-semibold focus:outline-none focus:border-blue-500"
            value={feedback}
            onChange={(e) => setFeedback(e.target.value)}
            placeholder="서비스를 사용하며 느낀 점, 개선/버그/건의사항 등을 자유롭게 남겨주세요."
            disabled={loading}
          />
          <button
            type="submit"
            className="w-full rounded-xl bg-blue-600 text-white font-bold py-3 transition hover:bg-blue-700 disabled:opacity-60"
            disabled={loading}
          >
            {loading ? "저장 중..." : "피드백 제출"}
          </button>
          {status && <div className="text-center text-sm text-blue-700 font-bold mt-2">{status}</div>}
        </form>
      </div>
    </div>
  );
}
