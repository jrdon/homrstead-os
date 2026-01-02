import { NextResponse } from "next/server";

export async function GET() {
  return NextResponse.json({
    acresPlanted: 5,
    projectedYield: 4200,
    updated: new Date().toISOString()
  });
}