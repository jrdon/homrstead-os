$ErrorActionPreference = "Stop"

Set-Location -Path $PSScriptRoot

function Write-File {
    param(
        [string]$Path,
        [string]$Content
    )

    # Force all paths to be absolute, based on the script directory
    $FullPath = Join-Path -Path $PSScriptRoot -ChildPath $Path

    $dir = Split-Path $FullPath
    if ($dir -and -not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }

    $utf8NoBomEncoding = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText($FullPath, $Content, $utf8NoBomEncoding)
}


Write-Host "Creating Homestead OS frontend project structure..." -ForegroundColor Cyan

# package.json
Write-File -Path "package.json" -Content @"
{
  "name": "homestead-os",
  "version": "1.0.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint"
  },
  "dependencies": {
    "@tanstack/react-query": "^5.0.0",
    "axios": "^1.7.0",
    "clsx": "^2.1.0",
    "next": "14.0.0",
    "react": "18.2.0",
    "react-dom": "18.2.0",
    "recharts": "^2.10.0",
    "zustand": "^4.5.0"
  },
  "devDependencies": {
    "@types/node": "20.10.0",
    "@types/react": "18.2.0",
    "@types/react-dom": "18.2.0",
    "autoprefixer": "10.4.16",
    "postcss": "8.4.32",
    "tailwindcss": "3.4.1",
    "typescript": "5.3.3",
    "eslint": "8.56.0",
    "eslint-config-next": "14.0.0"
  }
}
"@

# tsconfig.json
Write-File -Path "tsconfig.json" -Content @"
{
  "compilerOptions": {
    "target": "es5",
    "lib": ["dom", "dom.iterable", "esnext"],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "bundler",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "incremental": true,
    "paths": {
      "@/*": ["./src/*"]
    },
    "baseUrl": "."
  },
  "include": ["next-env.d.ts", "**/*.ts", "**/*.tsx"],
  "exclude": ["node_modules"]
}
"@

# next-env.d.ts
Write-File -Path "next-env.d.ts" -Content @"
/// <reference types="next" />
/// <reference types="next/image-types/global" />
"@

# next.config.mjs
Write-File -Path "next.config.mjs" -Content @"
/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true
};

export default nextConfig;
"@

# postcss.config.mjs
Write-File -Path "postcss.config.mjs" -Content @"
export default {
  plugins: {
    tailwindcss: {},
    autoprefixer: {}
  }
};
"@

# tailwind.config.ts
Write-File -Path "tailwind.config.ts" -Content @"
import type { Config } from "tailwindcss";

const config: Config = {
  content: [
    "./src/app/**/*.{js,ts,jsx,tsx,mdx}",
    "./src/components/**/*.{js,ts,jsx,tsx,mdx}"
  ],
  theme: {
    extend: {
      colors: {
        "brand-bg": "#050816",
        "brand-panel": "#020617"
      }
    }
  },
  plugins: []
};

export default config;
"@

# src/app/globals.css
Write-File -Path "src/app/globals.css" -Content @"
@tailwind base;
@tailwind components;
@tailwind utilities;

html, body {
  height: 100%;
  background-color: #050816;
  color: white;
}

* {
  box-sizing: border-box;
}
"@

# src/app/layout.tsx
Write-File -Path "src/app/layout.tsx" -Content @"
import "./globals.css";
import { ReactNode } from "react";

export const metadata = {
  title: "Homestead OS",
  description: "Command Center for Regenerative Homesteads"
};

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="en">
      <body className="min-h-screen flex flex-col bg-brand-bg text-white">
        {children}
      </body>
    </html>
  );
}
"@

# src/app/page.tsx
Write-File -Path "src/app/page.tsx" -Content @"
import { redirect } from "next/navigation";

export default function Home() {
  redirect("/dashboard");
}
"@

# src/app/dashboard/page.tsx
Write-File -Path "src/app/dashboard/page.tsx" -Content @"
"use client";

import CommandCenterShell from "@/components/layout/CommandCenterShell";
import Card from "@/components/ui/Card";
import Metric from "@/components/ui/Metric";
import SectionHeader from "@/components/ui/SectionHeader";
import SimpleLineChart from "@/components/charts/SimpleLineChart";

export default function DashboardPage() {
  return (
    <CommandCenterShell>
      <SectionHeader title="Dashboard Overview" />

      <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
        <Metric label="Active Hives" value="42" trend="+3 this week" />
        <Metric label="Irrigation Zones" value="12" trend="Stable" />
        <Metric label="Weather" value="68°F" trend="Clear" />
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <Card title="Apiary Production (lbs)">
          <SimpleLineChart
            data={[
              { name: "Jan", value: 120 },
              { name: "Feb", value: 150 },
              { name: "Mar", value: 180 },
              { name: "Apr", value: 220 },
              { name: "May", value: 260 }
            ]}
          />
        </Card>

        <Card title="Water Usage (gal)">
          <SimpleLineChart
            data={[
              { name: "Mon", value: 320 },
              { name: "Tue", value: 280 },
              { name: "Wed", value: 350 },
              { name: "Thu", value: 300 },
              { name: "Fri", value: 330 }
            ]}
          />
        </Card>
      </div>
    </CommandCenterShell>
  );
}
"@

# src/app/modules/apiary/page.tsx
Write-File -Path "src/app/modules/apiary/page.tsx" -Content @"
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
"@

# src/app/modules/orchard/page.tsx
Write-File -Path "src/app/modules/orchard/page.tsx" -Content @"
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
"@

# src/app/modules/potatoes/page.tsx
Write-File -Path "src/app/modules/potatoes/page.tsx" -Content @"
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
"@

# src/app/modules/irrigation/page.tsx
Write-File -Path "src/app/modules/irrigation/page.tsx" -Content @"
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
"@

# src/app/modules/livestock/page.tsx
Write-File -Path "src/app/modules/livestock/page.tsx" -Content @"
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
"@

# src/app/modules/weather/page.tsx
Write-File -Path "src/app/modules/weather/page.tsx" -Content @"
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
"@

# src/app/settings/page.tsx (for /settings link in Sidebar)
Write-File -Path "src/app/settings/page.tsx" -Content @"
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
"@

# src/app/api/sensors/route.ts
Write-File -Path "src/app/api/sensors/route.ts" -Content @"
import { NextResponse } from "next/server";

export async function GET() {
  return NextResponse.json([
    { id: "temp1", label: "Hive Temp", value: 92, unit: "°F", timestamp: new Date().toISOString() },
    { id: "hum1", label: "Humidity", value: 48, unit: "%", timestamp: new Date().toISOString() },
    { id: "soil1", label: "Soil Moisture", value: 32, unit: "%", timestamp: new Date().toISOString() }
  ]);
}
"@

# src/app/api/weather/route.ts
Write-File -Path "src/app/api/weather/route.ts" -Content @"
import { NextResponse } from "next/server";

export async function GET() {
  return NextResponse.json({
    temperature: 68,
    humidity: 22,
    wind: 5,
    conditions: "Clear",
    updated: new Date().toISOString()
  });
}
"@

# src/app/api/apiary/route.ts
Write-File -Path "src/app/api/apiary/route.ts" -Content @"
import { NextResponse } from "next/server";

export async function GET() {
  return NextResponse.json({
    hiveCount: 42,
    honeyProduction: {
      spring: 180,
      summer: 260,
      fall: 140
    },
    updated: new Date().toISOString()
  });
}
"@

# src/app/api/orchard/route.ts
Write-File -Path "src/app/api/orchard/route.ts" -Content @"
import { NextResponse } from "next/server";

export async function GET() {
  return NextResponse.json({
    trees: 120,
    healthIndex: 0.87,
    updated: new Date().toISOString()
  });
}
"@

# src/app/api/potatoes/route.ts
Write-File -Path "src/app/api/potatoes/route.ts" -Content @"
import { NextResponse } from "next/server";

export async function GET() {
  return NextResponse.json({
    acresPlanted: 5,
    projectedYield: 4200,
    updated: new Date().toISOString()
  });
}
"@

# src/app/api/irrigation/route.ts
Write-File -Path "src/app/api/irrigation/route.ts" -Content @"
import { NextResponse } from "next/server";

export async function GET() {
  return NextResponse.json({
    zones: 12,
    active: 4,
    flowRate: 18.5,
    updated: new Date().toISOString()
  });
}
"@

# src/app/api/livestock/route.ts
Write-File -Path "src/app/api/livestock/route.ts" -Content @"
import { NextResponse } from "next/server";

export async function GET() {
  return NextResponse.json({
    herdSize: 16,
    healthIndex: 0.92,
    updated: new Date().toISOString()
  });
}
"@

# src/app/api/drone/route.ts
Write-File -Path "src/app/api/drone/route.ts" -Content @"
import { NextResponse } from "next/server";

export async function GET() {
  return NextResponse.json({
    battery: 87,
    status: "Ready",
    lastFlight: "2026-01-01T12:00:00Z"
  });
}
"@

# src/components/layout/CommandCenterShell.tsx
Write-File -Path "src/components/layout/CommandCenterShell.tsx" -Content @"
"use client";

import Sidebar from "../navigation/Sidebar";
import TopBar from "../navigation/TopBar";
import StatusBar from "./StatusBar";
import MainContent from "./MainContent";

export default function CommandCenterShell({
  children
}: {
  children: React.ReactNode;
}) {
  return (
    <div className="flex h-screen w-full overflow-hidden bg-brand-bg text-white">
      <Sidebar />

      <div className="flex flex-col flex-1 overflow-hidden">
        <TopBar />

        <MainContent>{children}</MainContent>

        <StatusBar />
      </div>
    </div>
  );
}
"@

# src/components/layout/MainContent.tsx
Write-File -Path "src/components/layout/MainContent.tsx" -Content @"
export default function MainContent({
  children
}: {
  children: React.ReactNode;
}) {
  return (
    <main className="flex-1 overflow-y-auto p-6 bg-brand-panel">
      {children}
    </main>
  );
}
"@

# src/components/layout/StatusBar.tsx
Write-File -Path "src/components/layout/StatusBar.tsx" -Content @"
"use client";

import { useEffect, useState } from "react";

export default function StatusBar() {
  const [time, setTime] = useState("");

  useEffect(() => {
    const update = () => {
      const now = new Date();
      setTime(now.toLocaleTimeString());
    };
    update();
    const interval = setInterval(update, 1000);
    return () => clearInterval(interval);
  }, []);

  return (
    <div className="h-10 bg-black/40 flex items-center justify-between px-4 text-sm">
      <span className="opacity-80">Homestead OS — Command Center</span>
      <span className="opacity-80">{time}</span>
    </div>
  );
}
"@

# src/components/navigation/Sidebar.tsx
Write-File -Path "src/components/navigation/Sidebar.tsx" -Content @"
"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import clsx from "clsx";

const links = [
  { href: "/dashboard", label: "Dashboard" },
  { href: "/modules/apiary", label: "Apiary" },
  { href: "/modules/orchard", label: "Orchard" },
  { href: "/modules/potatoes", label: "Potatoes" },
  { href: "/modules/irrigation", label: "Irrigation" },
  { href: "/modules/livestock", label: "Livestock" },
  { href: "/modules/weather", label: "Weather" },
  { href: "/settings", label: "Settings" }
];

export default function Sidebar() {
  const pathname = usePathname();

  return (
    <aside className="w-56 bg-black/30 border-r border-white/10 flex flex-col p-4">
      <h1 className="text-xl font-bold mb-6">Homestead OS</h1>

      <nav className="flex flex-col gap-2">
        {links.map((link) => (
          <Link
            key={link.href}
            href={link.href}
            className={clsx(
              "px-3 py-2 rounded hover:bg-white/10 transition",
              pathname === link.href && "bg-white/20 font-semibold"
            )}
          >
            {link.label}
          </Link>
        ))}
      </nav>
    </aside>
  );
}
"@

# src/components/navigation/TopBar.tsx
Write-File -Path "src/components/navigation/TopBar.tsx" -Content @"
"use client";

export default function TopBar() {
  return (
    <header className="h-14 bg-black/40 border-b border-white/10 flex items-center px-4">
      <span className="text-lg font-semibold">Command Center</span>
    </header>
  );
}
"@

# src/components/ui/Card.tsx
Write-File -Path "src/components/ui/Card.tsx" -Content @"
export default function Card({
  title,
  children
}: {
  title: string;
  children: React.ReactNode;
}) {
  return (
    <div className="bg-black/30 border border-white/10 rounded-lg p-4">
      <h2 className="text-lg font-semibold mb-3">{title}</h2>
      {children}
    </div>
  );
}
"@

# src/components/ui/Metric.tsx
Write-File -Path "src/components/ui/Metric.tsx" -Content @"
export default function Metric({
  label,
  value,
  trend
}: {
  label: string;
  value: string | number;
  trend?: string;
}) {
  return (
    <div className="bg-black/30 border border-white/10 rounded-lg p-4">
      <div className="text-sm opacity-70">{label}</div>
      <div className="text-3xl font-bold mt-1">{value}</div>
      {trend && <div className="text-xs opacity-60 mt-1">{trend}</div>}
    </div>
  );
}
"@

# src/components/ui/SectionHeader.tsx
Write-File -Path "src/components/ui/SectionHeader.tsx" -Content @"
export default function SectionHeader({ title }: { title: string }) {
  return (
    <h1 className="text-2xl font-bold mb-6 border-b border-white/10 pb-2">
      {title}
    </h1>
  );
}
"@

# src/components/ui/Badge.tsx
Write-File -Path "src/components/ui/Badge.tsx" -Content @"
import clsx from "clsx";

export default function Badge({
  label,
  type = "default"
}: {
  label: string;
  type?: "default" | "success" | "warning" | "danger";
}) {
  const colors = {
    default: "bg-white/10 text-white",
    success: "bg-green-600/40 text-green-200",
    warning: "bg-yellow-600/40 text-yellow-200",
    danger: "bg-red-600/40 text-red-200"
  };

  return (
    <span
      className={clsx(
        "px-2 py-1 rounded text-xs font-semibold",
        colors[type]
      )}
    >
      {label}
    </span>
  );
}
"@

# src/components/charts/SimpleLineChart.tsx
Write-File -Path "src/components/charts/SimpleLineChart.tsx" -Content @"
"use client";

import {
  LineChart,
  Line,
  XAxis,
  YAxis,
  Tooltip,
  ResponsiveContainer
} from "recharts";

export default function SimpleLineChart({
  data
}: {
  data: { name: string; value: number }[];
}) {
  return (
    <div className="w-full h-64">
      <ResponsiveContainer width="100%" height="100%">
        <LineChart data={data}>
          <XAxis dataKey="name" stroke="#ccc" />
          <YAxis stroke="#ccc" />
          <Tooltip
            contentStyle={{
              backgroundColor: "#111",
              border: "1px solid #333",
              borderRadius: "6px"
            }}
          />
          <Line
            type="monotone"
            dataKey="value"
            stroke="#22c55e"
            strokeWidth={3}
            dot={false}
          />
        </LineChart>
      </ResponsiveContainer>
    </div>
  );
}
"@

# src/hooks/useSensorQuery.ts
Write-File -Path "src/hooks/useSensorQuery.ts" -Content @"
"use client";

import { useQuery } from "@tanstack/react-query";
import axios from "axios";

export default function useSensorQuery() {
  return useQuery({
    queryKey: ["sensors"],
    queryFn: async () => {
      const res = await axios.get("/api/sensors");
      return res.data;
    },
    refetchInterval: 5000
  });
}
"@

# src/lib/apiClient.ts
Write-File -Path "src/lib/apiClient.ts" -Content @"
import axios from "axios";

const apiClient = axios.create({
  baseURL: "/api",
  timeout: 5000
});

export default apiClient;
"@

# src/lib/sensors.ts
Write-File -Path "src/lib/sensors.ts" -Content @"
export type SensorReading = {
  id: string;
  label: string;
  value: number;
  unit: string;
  timestamp: string;
};
"@

# src/store/uiStore.ts
Write-File -Path "src/store/uiStore.ts" -Content @"
import { create } from "zustand";

type UIState = {
  sidebarOpen: boolean;
  toggleSidebar: () => void;
};

export const useUIStore = create<UIState>((set) => ({
  sidebarOpen: true,
  toggleSidebar: () =>
    set((state) => ({ sidebarOpen: !state.sidebarOpen }))
}));
"@

# src/styles/theme.ts
Write-File -Path "src/styles/theme.ts" -Content @"
export const theme = {
  colors: {
    background: "#050816",
    panel: "#0f172a",
    accent: "#22c55e",
    accentSoft: "#bbf7d0",
    danger: "#ef4444",
    warn: "#facc15"
  }
};
"@

# README.md
Write-File -Path "README.md" -Content @"
# Homestead OS – Command Center

This is the Homestead OS frontend, built with Next.js, Tailwind CSS, and a simple mock API layer.

## Getting Started

1. Install dependencies:

   \`\`\`bash
   npm install
   \`\`\`

2. Run the development server:

   \`\`\`bash
   npm run dev
   \`\`\`

3. Open \`http://localhost:3000\` in your browser.

The dashboard, modules, and mock API routes are all wired and ready for expansion.
"@

Write-Host "Homestead OS project files created successfully." -ForegroundColor Green
Write-Host "
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1) Run: npm install"
Write-Host "2) Run: npm run dev"
Write-Host "3) Open http://localhost:3000 in your browser"
