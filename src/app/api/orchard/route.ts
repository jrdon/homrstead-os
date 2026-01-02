import { NextResponse } from "next/server";

export async function GET() {
  return NextResponse.json({
    trees: 120,
    healthIndex: 0.87,
    updated: new Date().toISOString()
  });
}