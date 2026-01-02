import { NextResponse } from "next/server";

export async function GET() {
  return NextResponse.json({
    herdSize: 16,
    healthIndex: 0.92,
    updated: new Date().toISOString()
  });
}