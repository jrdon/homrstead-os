import { NextResponse } from "next/server";

export async function GET() {
  return NextResponse.json([
    { id: "temp1", label: "Hive Temp", value: 92, unit: "Â°F", timestamp: new Date().toISOString() },
    { id: "hum1", label: "Humidity", value: 48, unit: "%", timestamp: new Date().toISOString() },
    { id: "soil1", label: "Soil Moisture", value: 32, unit: "%", timestamp: new Date().toISOString() }
  ]);
}