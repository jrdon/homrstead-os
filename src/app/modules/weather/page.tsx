"use client";

import CommandCenterShell from "@/components/layout/CommandCenterShell";
import SectionHeader from "@/components/ui/SectionHeader";
import Card from "@/components/ui/Card";

export default function WeatherModule() {
  return (
    <CommandCenterShell>
      <SectionHeader title="Weather Module" />

      <Card title="Current Conditions">
        <p className="opacity-80">
          Weather API integration will appear here.
        </p>
      </Card>
    </CommandCenterShell>
  );
}