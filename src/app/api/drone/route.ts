import { NextResponse } from "next/server";

export async function GET() {
  return NextResponse.json({
    battery: 87,
    status: "Ready",
    lastFlight: "2026-01-01T12:00:00Z"
  });
}