"use client";

import { useEffect, useRef } from "react";

export default function MapPage() {
  const mapRef = useRef<HTMLDivElement | null>(null);

  useEffect(() => {
    if (mapRef.current) {
      console.log("Map container ready:", mapRef.current);
    }
  }, []);

  return (
    <div style={{ width: "100%", height: "100%", background: "#e5e5e5" }}>
      <h1 style={{ padding: "10px" }}>Map Module</h1>

      <div
        ref={mapRef}
        style={{
          width: "100%",
          height: "calc(100% - 50px)",
          background: "#ccc",
          border: "2px solid #999",
        }}
      />
    </div>
  );
}
