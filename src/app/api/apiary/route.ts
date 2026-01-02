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