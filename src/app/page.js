"use client";
import { useEffect, useState } from "react";
import { supabase } from "@/lib/supabase";

export default function Home() {
  const [questions, setQuestions] = useState([]);
  const [current, setCurrent] = useState(0);
  const [selected, setSelected] = useState(null);
  const [showExplanation, setShowExplanation] = useState(false);
  const [score, setScore] = useState(0);
  const [loading, setLoading] = useState(true);

  const [activeType, setActiveType] = useState("문자·어휘");
  const [activeSubType, setActiveSubType] = useState("랜덤");

  // ✅ 완전 랜덤 셔플 (Fisher-Yates)
  const shuffleArray = (array) => {
    const newArr = [...array];
    for (let i = newArr.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [newArr[i], newArr[j]] = [newArr[j], newArr[i]];
    }
    return newArr;
  };

  // ✅ 옵션 섞고 정답 재설정
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

  useEffect(() => {
    const fetchQuestions = async () => {
      setLoading(true);

      let query = supabase.from("questions").select("*").eq("type", activeType);

      if (activeType === "문자·어휘" && activeSubType !== "랜덤") {
        query = query.eq("sub_type", activeSubType);
      }

      const { data } = await query;

      if (data && data.length > 0) {
        // ✅ 문제 순서 랜덤
        const shuffledQuestions = shuffleArray(data);

        // ✅ 각 문제 옵션도 랜덤화
        const processed = shuffledQuestions
          .slice(0, 5)
          .map((q) => shuffleOptions(q));

        setQuestions(processed);
        setCurrent(0);
        setSelected(null);
        setShowExplanation(false);
        setScore(0);
      } else {
        setQuestions([]);
      }

      setLoading(false);
    };

    fetchQuestions();
  }, [activeType, activeSubType]);

  const q = questions[current];

  // ✅ 검수 로그
  useEffect(() => {
    if (q && !q.question.includes("____")) {
      console.warn("빈칸 없는 문제 발견:", q);
    }
  }, [q]);

  if (loading)
    return <div className="p-4 text-center text-blue-500 font-bold">문제를 가져오는 중...</div>;

  if (!q)
    return <div className="p-4 text-center text-gray-500">문제가 없습니다.</div>;

  if (questions.length === 0)
    return (
      <div className="p-4 text-center">
        <TypeTabs activeType={activeType} setActiveType={setActiveType} setActiveSubType={setActiveSubType} />
        <p className="mt-10 text-gray-500">해당 분류에 등록된 문제가 없습니다.</p>
      </div>
    );

  const options = [q.option1, q.option2, q.option3, q.option4];

  return (
    <div className="min-h-screen bg-blue-50 flex flex-col items-center px-4 py-5 sm:px-6 sm:py-6">
      <div className="w-full max-w-md mb-4 text-center px-2">
        <h1 className="text-2xl sm:text-3xl font-bold text-blue-600">🌸 JLPT 연습</h1>
      </div>

      <TypeTabs activeType={activeType} setActiveType={setActiveType} setActiveSubType={setActiveSubType} />

      {activeType === "문자·어휘" && (
        <div className="flex flex-wrap gap-2 mb-4 w-full max-w-md overflow-x-auto pb-2">
          {["랜덤", "한자 읽기", "표기", "문맥 규정"].map((sub) => (
            <button
              key={sub}
              onClick={() => setActiveSubType(sub)}
              className={`px-4 py-2 rounded-full text-sm whitespace-nowrap border transition ease-in-out duration-150 ${
                activeSubType === sub
                  ? "bg-blue-100 border-blue-400 text-blue-700"
                  : "bg-white border-gray-200 text-gray-500 hover:bg-gray-50"
              }`}
            >
              {sub}
            </button>
          ))}
        </div>
      )}

      <div className="w-full max-w-md bg-white rounded-[28px] shadow-lg p-4 sm:p-6">
        <div className="mb-4 flex flex-col gap-2 sm:flex-row sm:items-center sm:justify-between text-[11px] sm:text-[12px] font-semibold tracking-widest text-gray-500 uppercase">
          <span>
            {q.sub_type || q.type}
            {q.level ? ` (${q.level})` : ""}
          </span>
          <span>{current + 1} / {questions.length}</span>
        </div>

        {/* 빈칸 강조 */}
        <p className="mb-6 text-lg sm:text-xl font-semibold text-gray-800 text-center leading-7">
          {q.question.split("____").map((part, i, arr) => (
            <span key={i}>
              {part}
              {i < arr.length - 1 && (
                <span className="mx-1 font-bold text-blue-500">____</span>
              )}
            </span>
          ))}
        </p>

        <div className="grid grid-cols-1 gap-3">
          {options.map((opt, i) => {
            let btnStyle = "bg-gray-50 border-gray-100 text-gray-700";

            if (showExplanation) {
              if (i + 1 === q.answer) {
                btnStyle = "bg-green-100 border-green-500 text-green-700 font-semibold";
              } else if (selected === i) {
                btnStyle = "bg-red-100 border-red-500 text-red-700";
              }
            }

            return (
              <button
                key={i}
                onClick={() => {
                  if (!showExplanation) {
                    setSelected(i);
                    setShowExplanation(true);
                    if (i + 1 === q.answer) {
                      setScore((s) => s + 1);
                    }
                  }
                }}
                className={`w-full p-4 rounded-2xl text-left border-2 transition-all duration-150 ${btnStyle}`}
                disabled={showExplanation}
              >
                <span className="inline-flex items-center justify-center w-8 h-8 mr-3 rounded-full bg-blue-50 text-blue-500 font-bold text-sm">
                  {i + 1}
                </span>
                <span className="text-sm sm:text-base">{opt}</span>
              </button>
            );
          })}
        </div>

        {showExplanation && (
          <div className="mt-6">
            <div className="p-4 bg-gray-50 rounded-xl border border-dashed border-gray-200">
              <p className="text-sm text-gray-600">💡 {q.explanation}</p>
            </div>

            <button
              onClick={() =>
                current < questions.length - 1
                  ? (setCurrent((c) => c + 1), setSelected(null), setShowExplanation(false))
                  : window.location.reload()
              }
              className="mt-4 w-full bg-blue-600 text-white py-4 rounded-2xl font-semibold text-base shadow-md hover:bg-blue-700 transition-colors"
            >
              {current < questions.length - 1 ? "다음 문제" : "다시 하기"}
            </button>
          </div>
        )}
      </div>
    </div>
  );
}

function TypeTabs({ activeType, setActiveType, setActiveSubType }) {
  const types = [
    { name: "문자·어휘", disabled: false },
    { name: "문법·독해", disabled: true },
    { name: "청해", disabled: true },
  ];

  return (
    <div className="flex flex-col gap-2 mb-4 w-full max-w-md sm:flex-row sm:space-x-2">
      {types.map((type) => (
        <button
          key={type.name}
          onClick={() => {
            if (type.disabled) return;
            setActiveType(type.name);
            setActiveSubType(type.name === "문자·어휘" ? "랜덤" : "");
          }}
          disabled={type.disabled}
          className={`w-full min-w-[90px] px-4 py-3 text-sm rounded-2xl font-semibold transition duration-150 ${
            activeType === type.name
              ? "bg-blue-600 text-white shadow-lg"
              : type.disabled
              ? "bg-gray-100 text-gray-300 cursor-not-allowed"
              : "bg-white text-gray-600 shadow-sm hover:bg-gray-50"
          }`}
        >
          <span className="leading-tight">
            {type.name}
            {type.disabled && " (준비중)"}
          </span>
        </button>
      ))}
    </div>
  );
}