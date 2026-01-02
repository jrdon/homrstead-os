"use client";

import Sidebar from "../navigation/Sidebar";
import TopBar from "../navigation/TopBar";

export default function CommandCenterShell({ children }: { children: React.ReactNode }) {
  return (
    <div className="min-h-screen flex flex-row bg-brand-bg text-white">
      <Sidebar />

      <div className="flex flex-col flex-1">
        <TopBar />

        <main className="p-6">
          {children}
        </main>
      </div>
    </div>
  );
}
