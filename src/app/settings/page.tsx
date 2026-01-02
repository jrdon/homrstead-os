"use client";

import CommandCenterShell from "@/components/layout/CommandCenterShell";
import SectionHeader from "@/components/ui/SectionHeader";
import Card from "@/components/ui/Card";

export default function SettingsPage() {
  return (
    <CommandCenterShell>
      <SectionHeader title="Settings" />

      <Card title="Command Center Settings">
        <p className="opacity-80">
          Global Homestead OS settings and configuration will appear here.
        </p>
      </Card>
    </CommandCenterShell>
  );
}