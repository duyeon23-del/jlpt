"use client";
import { useEffect, useState } from "react";

export default function Onboarding({ onComplete, onNoExam, errorMessage, isEditing, initialExamDate, onCancel }) {
  const [examDate, setExamDate] = useState(initialExamDate || "");
  const [loading, setLoading] = useState(false);
  const [submitError, setSubmitError] = useState("");
  const todayLocal = new Date(Date.now() - new Date().getTimezoneOffset() * 60000)
    .toISOString()
    .split("T")[0];

  useEffect(() => {
    setSubmitError(errorMessage || "");
  }, [errorMessage]);

  useEffect(() => {
    setExamDate(initialExamDate || "");
  }, [initialExamDate]);

  const handleSelectDate = async (nextExamDate) => {
    if (!nextExamDate || loading) return;

    if (isEditing && initialExamDate && nextExamDate === initialExamDate) {
      setSubmitError("");
      if (onCancel) {
        onCancel();
      }
      return;
    }

    if (nextExamDate < todayLocal) {
      setSubmitError("시험일은 오늘 이후 날짜만 선택할 수 있습니다.");
      return;
    }

    setExamDate(nextExamDate);
    setSubmitError("");
    setLoading(true);
    const success = await onComplete(nextExamDate);
    setLoading(false);

    if (!success) {
      setSubmitError(errorMessage || "시험일 설정에 실패했습니다.");
    }
  };

  const handleNoExam = async () => {
    if (!onNoExam) return;

    setSubmitError("");
    setLoading(true);
    const success = await onNoExam();
    setLoading(false);

    if (!success) {
      setSubmitError(errorMessage || "설정 저장에 실패했습니다.");
    }
  };

  return (
    <div className="min-h-screen bg-[linear-gradient(180deg,#edf5ff_0%,#f8fbff_55%,#eef4ff_100%)] px-4 py-8 flex items-center justify-center">
      <div className="w-full max-w-sm rounded-3xl border border-white/70 bg-white/95 p-6 shadow-[0_24px_60px_rgba(15,23,42,0.10)] backdrop-blur space-y-6">
        {/* 헤더 */}
        <div className="text-center space-y-2">
          <div className="text-4xl mb-2">🌸</div>
          <h1 className="text-2xl font-black text-blue-700">
            {isEditing ? "시험일 변경" : "나만의 JLPT 연습"}
          </h1>
          {!isEditing && <p className="text-sm text-slate-600">합격을 위한 개인화 학습</p>}
        </div>

        {/* 설명 */}
        {!isEditing && (
          <div className="rounded-xl bg-blue-50 p-4 space-y-2 text-sm text-slate-700">
            <p className="font-bold text-blue-700">시험일은 언제에요?</p>
            <p>날짜를 선택하면 바로 풀어보기로 이동합니다.</p>
          </div>
        )}

        <div className="space-y-4">
          {/* JLPT 급수 선택 (기본 N5, 추후 확장 대비) */}
          <div className="space-y-2">
            <label className="block text-sm font-bold text-slate-800">급수</label>
            <div className="flex gap-2">
              <button
                type="button"
                className="rounded-full border border-amber-300 bg-amber-50 px-4 py-1 text-sm font-bold text-amber-700 cursor-default"
                style={{ minWidth: 56 }}
                tabIndex={-1}
                aria-label="JLPT N5 (고정)"
              >
                N5
              </button>
              {/* 추후 N4~N1 확장 가능 */}
            </div>
          </div>
          <div className="space-y-2">
            <label className="block text-sm font-bold text-slate-800">
              시험일은 언제에요?
            </label>
            <input
              type="date"
              value={examDate}
              onChange={(e) => handleSelectDate(e.target.value)}
              onBlur={() => {
                if (isEditing && examDate && !loading) {
                  handleSelectDate(examDate);
                }
              }}
              disabled={loading}
              min={todayLocal}
              className="w-full h-12 rounded-lg border border-slate-300 bg-white px-3 text-slate-900 font-semibold focus:outline-none focus:border-blue-500 disabled:bg-slate-100"
            />
          </div>

          {submitError ? (
            <div className="rounded-xl border border-rose-200 bg-rose-50 px-3 py-2 text-sm font-semibold text-rose-700">
              {submitError}
            </div>
          ) : null}

          {isEditing ? (
            <div className="grid grid-cols-2 gap-2">
              <button
                type="button"
                onClick={handleNoExam}
                disabled={loading}
                className="min-h-[48px] rounded-xl border border-slate-300 bg-slate-50 text-slate-700 font-bold hover:bg-slate-100 transition active:scale-[0.99] disabled:opacity-50"
              >
                시험예정 없음
              </button>
              <button
                type="button"
                onClick={onCancel}
                className="min-h-[48px] rounded-xl border border-slate-300 bg-white text-slate-700 font-bold hover:bg-slate-50 transition active:scale-[0.99]"
              >
                돌아가기
              </button>
            </div>
          ) : (
            <button
              type="button"
              onClick={handleNoExam}
              disabled={loading}
              className="w-full min-h-[52px] rounded-xl border border-slate-300 bg-slate-50 text-slate-700 font-bold hover:bg-slate-100 transition active:scale-[0.99] disabled:opacity-50"
            >
              시험예정 없음
            </button>
          )}
        </div>

        {/* 하단 텍스트 */}
        <p className="text-center text-xs text-slate-500">
          나중에 변경할 수 있습니다
        </p>
      </div>
    </div>
  );
}
