
"use client";
import { useState, useEffect, useRef } from "react";
import { useRouter } from "next/navigation";
import { supabase } from "@/lib/supabase";
import { useUser } from "@/lib/useUser";

export default function FeedbackPage() {

  const { user } = useUser();
  const [feedback, setFeedback] = useState("");
  const [status, setStatus] = useState("");
  const [loading, setLoading] = useState(false);
  const [submitted, setSubmitted] = useState(false);
  const [prevPath, setPrevPath] = useState("/");
  const [imageFile, setImageFile] = useState(null);
  const [imagePreview, setImagePreview] = useState(null);
  const router = useRouter();
  const fileInputRef = useRef();

  // 피드백 진입 시 이전 경로 기억
  useEffect(() => {
    if (typeof window !== "undefined") {
      const prev = document.referrer && new URL(document.referrer).origin === window.location.origin
        ? new URL(document.referrer).pathname
        : "/";
      setPrevPath(prev);
    }
  }, []);

  // 이미지 미리보기
  useEffect(() => {
    if (imageFile) {
      const reader = new FileReader();
      reader.onload = (e) => setImagePreview(e.target.result);
      reader.readAsDataURL(imageFile);
    } else {
      setImagePreview(null);
    }
  }, [imageFile]);

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!feedback.trim()) {
      setStatus("내용을 입력해 주세요.");
      return;
    }
    setLoading(true);
    setStatus("");

    let imageUrl = null;
    if (imageFile) {
      const ext = imageFile.name.split('.').pop();
      const fileName = `feedback_${Date.now()}_${Math.random().toString(36).slice(2)}.${ext}`;
      const { data: uploadData, error: uploadError } = await supabase.storage
        .from("feedback-images")
        .upload(fileName, imageFile, {
          cacheControl: "3600",
          upsert: false,
        });
      if (uploadError) {
        console.error(uploadError); // 실제 에러 메시지 콘솔 출력
        alert("[업로드 에러] " + (uploadError.message || uploadError.error_description || JSON.stringify(uploadError)));
        setStatus("이미지 업로드에 실패했습니다. 다시 시도해 주세요.");
        setLoading(false);
        return;
      }
      imageUrl = supabase.storage.from("feedback-images").getPublicUrl(fileName).data.publicUrl;
    }

    const { error } = await supabase.from("feedbacks").insert({
      user_id: user?.id || null,
      feedback_text: feedback,
      extra_info: imageUrl ? { image_url: imageUrl } : null,
    });
    setLoading(false);
    if (error) {
      setStatus("저장에 실패했습니다. 다시 시도해 주세요.");
    } else {
      setStatus("");
      setFeedback("");
      setImageFile(null);
      setSubmitted(true);
    }
  };

  return (
    <div className="min-h-screen flex flex-col items-center justify-center bg-gradient-to-b from-blue-50 to-white px-4 py-8">
      <div className="w-full max-w-md rounded-2xl border border-slate-200 bg-white/95 p-6 shadow-lg">
        <h1 className="text-xl font-black text-blue-700 mb-2">피드백 남기기</h1>
        {submitted ? (
          <div className="flex flex-col items-center space-y-4">
            <div className="text-center text-blue-700 font-bold text-lg">피드백이 저장되었습니다. 감사합니다!</div>
            <button
              className="w-full rounded-xl bg-blue-600 text-white font-bold py-3 transition hover:bg-blue-700"
              onClick={() => router.push(prevPath || "/")}
            >
              돌아가기
            </button>
          </div>
        ) : (
          <form onSubmit={handleSubmit} className="space-y-4">
            <textarea
              className="w-full h-32 rounded-lg border border-slate-300 px-3 py-2 text-slate-900 font-semibold focus:outline-none focus:border-blue-500"
              value={feedback}
              onChange={(e) => setFeedback(e.target.value)}
              placeholder="서비스를 사용하며 느낀 점, 개선/버그/건의사항 등을 자유롭게 남겨주세요."
              disabled={loading}
            />
            <div className="flex flex-col gap-2 p-4 rounded-lg border-2 border-blue-200 bg-blue-50">
              <label className="font-bold text-blue-700 mb-1" htmlFor="feedback-image-input">파일첨부 (스크린샷 등)</label>
              <input
                id="feedback-image-input"
                type="file"
                accept="image/*"
                ref={fileInputRef}
                onChange={e => setImageFile(e.target.files?.[0] || null)}
                disabled={loading}
                className="file:mr-2 file:py-1 file:px-3 file:rounded file:border-0 file:bg-blue-600 file:text-white file:font-bold file:cursor-pointer"
              />
              {imagePreview && (
                <img src={imagePreview} alt="미리보기" className="max-h-40 rounded border border-slate-200 mt-2" />
              )}
            </div>
            <button
              type="submit"
              className="w-full rounded-xl bg-blue-600 text-white font-bold py-3 transition hover:bg-blue-700 disabled:opacity-60"
              disabled={loading}
            >
              {loading ? "저장 중..." : "피드백 제출"}
            </button>
            {status && <div className="text-center text-sm text-blue-700 font-bold mt-2">{status}</div>}
          </form>
        )}
      </div>
    </div>
  );
}
