"use client";

import CommandCenterShell from "@/components/layout/CommandCenterShell";
import Card from "@/components/ui/Card";
import Map from "../modules/map1/map";

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

        {/* Full-width map module */}
        <div className="col-span-1 md:grid-cols-2 lg:col-span-3 h-[80vh]">
          <Map />

          {/* TEST BLOCK */}
          <div className="w-full h-full bg-red-500 text-white p-10 text-3xl">
            MAP TEST BLOCK
          </div>
        </div>
      </div>
    </CommandCenterShell>
  );
}

