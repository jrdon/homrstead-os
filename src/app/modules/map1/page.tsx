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
    <div
      style={{
        width: "100%",
        height: "100%",
        background: "#e5e5e5",
        display: "flex",
        flexDirection: "column",
      }}
    >
      <h1 style={{ padding: "10px", fontSize: "1.2rem", fontWeight: "bold" }}>
        Map Module
      </h1>

      <div
        ref={mapRef}
        style={{
          flex: 1,
          width: "100%",
          background: "#ccc",
          border: "2px solid #999",
          borderRadius: "6px",
        }}
      />
    </div>
  );
}
