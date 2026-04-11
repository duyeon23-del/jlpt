"use client";
import { useEffect, useState } from "react";
import { supabase } from "@/lib/supabase";

export default function Home() {
  // 🔥 state
  const [questions, setQuestions] = useState([]);
  const [current, setCurrent] = useState(0);
  const [selected, setSelected] = useState(null);
  const [showExplanation, setShowExplanation] = useState(false);
  const [score, setScore] = useState(0);

  // 🔥 데이터 가져오기
  const fetchQuestions = async () => {
    const { data, error } = await supabase
      .from("questions")
      .select("*");

    if (data) {
      const shuffled = data.sort(() => 0.5 - Math.random());
      setQuestions(shuffled.slice(0, 5));
      setCurrent(0);
      setSelected(null);
      setShowExplanation(false);
      setScore(0);
    }
  };

  useEffect(() => {
    fetchQuestions();
  }, []);

  // 🔥 현재 문제
  const q = questions[current];

  if (!q) {
    return <div className="p-4">Loading...</div>;
  }

  // 🔥 선택지 배열
  const options = [q.option1, q.option2, q.option3, q.option4];

  // 🔥 선택 처리
  const handleSelect = (index) => {
    setSelected(index);
    setShowExplanation(true);

    if (index + 1 === q.answer) {
      setScore((prev) => prev + 1); // ✅ 안정적인 방식
    }
  };

  // 🔥 다음 문제
  const nextQuestion = () => {
    setCurrent((prev) => prev + 1);
    setSelected(null);
    setShowExplanation(false);
  };

  return (
    <div className="min-h-screen bg-blue-50 flex flex-col items-center p-4">
      
      {/* 헤더 */}
      <div className="w-full max-w-md mb-4 text-center">
        <h1 className="text-2xl font-bold text-blue-600">
          🌸 JLPT Master
        </h1>
        <p className="text-gray-600">Daily Practice</p>
      </div>

      {/* 카드 */}
      <div className="w-full max-w-md bg-white rounded-2xl shadow p-6">

        {/* 진행률 */}
        <div className="mb-4 text-sm text-gray-500">
          문제 {current + 1} / {questions.length}
        </div>

        {/* 문제 */}
        <p className="mb-4 text-lg font-medium text-gray-800">
          {q.question}
        </p>

        {/* 선택지 */}
        <div className="space-y-3">
          {options.map((opt, i) => {
            let bg = "bg-gray-100 hover:bg-gray-200";

            if (showExplanation) {
              if (i + 1 === q.answer) bg = "bg-green-300";
              else if (i === selected) bg = "bg-red-300";
            }

            return (
              <button
                key={i}
                onClick={() => handleSelect(i)}
                className={`w-full p-3 rounded-xl transition ${bg}`}
                disabled={showExplanation}
              >
                {opt}
              </button>
            );
          })}
        </div>

        {/* 해설 & 결과 */}
        {showExplanation && (
          <div className="mt-4 p-4 bg-gray-50 rounded-xl">
            <p className="text-sm text-gray-800">
              💡 {q.explanation}
            </p>

            {current < questions.length - 1 ? (
              <button
                onClick={nextQuestion}
                className="mt-3 w-full bg-blue-500 text-white p-2 rounded-xl"
              >
                다음 문제 →
              </button>
            ) : (
              <div className="mt-3 text-center space-y-3">
                <div>
                  <p className="font-bold text-lg">🎉 오늘 결과</p>
                  <p className="text-blue-600 mt-2">
                    {questions.length}문제 중 {score}개 정답!
                  </p>
                </div>
                <button
                  onClick={fetchQuestions}
                  className="w-full inline-flex items-center justify-center gap-2 bg-green-500 text-white p-2 rounded-xl"
                >
                  🔄 또 해보기
                </button>
              </div>
            )}
          </div>
        )}
      </div>
    </div>
  );
}