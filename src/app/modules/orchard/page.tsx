"use client";

import CommandCenterShell from "@/components/layout/CommandCenterShell";
import SectionHeader from "@/components/ui/SectionHeader";
import Card from "@/components/ui/Card";

export default function OrchardModule() {
  return (
    <CommandCenterShell>
      <SectionHeader title="Orchard Module" />

      <Card title="Tree Health Overview">
        <p className="opacity-80">
          Orchard monitoring and production metrics will appear here.
        </p>
      </Card>
    </CommandCenterShell>
  );
}