"use client";

import CommandCenterShell from "@/components/layout/CommandCenterShell";
import SectionHeader from "@/components/ui/SectionHeader";
import Card from "@/components/ui/Card";

export default function PotatoesModule() {
  return (
    <CommandCenterShell>
      <SectionHeader title="Potato Production Module" />

      <Card title="Field Overview">
        <p className="opacity-80">
          Potato planter, hiller, and yield tracking will be integrated here.
        </p>
      </Card>
    </CommandCenterShell>
  );
}