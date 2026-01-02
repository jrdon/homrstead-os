import { NextResponse } from "next/server";

export async function GET() {
  return NextResponse.json({
    zones: 12,
    active: 4,
    flowRate: 18.5,
    updated: new Date().toISOString()
  });
}