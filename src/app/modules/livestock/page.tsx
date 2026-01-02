"use client";

import CommandCenterShell from "@/components/layout/CommandCenterShell";
import SectionHeader from "@/components/ui/SectionHeader";
import Card from "@/components/ui/Card";

export default function LivestockModule() {
  return (
    <CommandCenterShell>
      <SectionHeader title="Livestock Module" />

      <Card title="Herd Overview">
        <p className="opacity-80">
          Livestock tracking, feed, and health metrics will appear here.
        </p>
      </Card>
    </CommandCenterShell>
  );
}