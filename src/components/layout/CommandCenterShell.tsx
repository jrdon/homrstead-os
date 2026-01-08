"use client";

import Sidebar from "../navigation/Sidebar";
import TopBar from "../navigation/TopBar";

export default function CommandCenterShell({ children }: { children: React.ReactNode }) {
  return (
    <div className="h-screen flex flex-row bg-brand-bg text-white overflow-hidden">
      <Sidebar />

      <div className="flex flex-col flex-1 overflow-hidden">
        <TopBar />

        <main className="flex-1 overflow-auto p-6 min-h-0">
          {children}
        </main>
      </div>
    </div>
  );
}

