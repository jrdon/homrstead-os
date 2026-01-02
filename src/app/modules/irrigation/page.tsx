"use client";

import CommandCenterShell from "@/components/layout/CommandCenterShell";
import SectionHeader from "@/components/ui/SectionHeader";
import Card from "@/components/ui/Card";

export default function IrrigationModule() {
  return (
    <CommandCenterShell>
      <SectionHeader title="Irrigation Module" />

      <Card title="Zone Status">
        <p className="opacity-80">
          Irrigation zones, flow rates, and schedules will appear here.
        </p>
      </Card>
    </CommandCenterShell>
  );
}