"use client";

import CommandCenterShell from "@/components/layout/CommandCenterShell";
import SectionHeader from "@/components/ui/SectionHeader";
import Card from "@/components/ui/Card";
import SimpleLineChart from "@/components/charts/SimpleLineChart";

export default function ApiaryModule() {
  return (
    <CommandCenterShell>
      <SectionHeader title="Apiary Module" />

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <Card title="Honey Production (lbs)">
          <SimpleLineChart
            data={[
              { name: "Spring", value: 180 },
              { name: "Summer", value: 260 },
              { name: "Fall", value: 140 }
            ]}
          />
        </Card>

        <Card title="Hive Count">
          <SimpleLineChart
            data={[
              { name: "2021", value: 28 },
              { name: "2022", value: 34 },
              { name: "2023", value: 42 }
            ]}
          />
        </Card>
      </div>
    </CommandCenterShell>
  );
}