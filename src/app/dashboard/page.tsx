"use client";

import CommandCenterShell from "@/components/layout/CommandCenterShell";
import Card from "@/components/ui/Card";

export default function DashboardPage() {
  return (
    <CommandCenterShell>
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        <Card title="System Status">
          <p>All systems operational.</p>
        </Card>

        <Card title="Weather">
          <p>Weather module placeholder.</p>
        </Card>

        <Card title="Irrigation">
          <p>Irrigation module placeholder.</p>
        </Card>
      </div>
    </CommandCenterShell>
  );
}
