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