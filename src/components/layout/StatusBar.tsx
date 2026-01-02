"use client";

import { useEffect, useState } from "react";

export default function StatusBar() {
  const [time, setTime] = useState("");

  useEffect(() => {
    const update = () => {
      const now = new Date();
      setTime(now.toLocaleTimeString());
    };
    update();
    const interval = setInterval(update, 1000);
    return () => clearInterval(interval);
  }, []);

  return (
    <div className="h-10 bg-black/40 flex items-center justify-between px-4 text-sm">
      <span className="opacity-80">Homestead OS â€” Command Center</span>
      <span className="opacity-80">{time}</span>
    </div>
  );
}