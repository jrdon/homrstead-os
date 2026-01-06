"use client";

import { useEffect, useRef } from "react";

export default function MapPage() {
  const mapRef = useRef<HTMLDivElement | null>(null);

  useEffect(() => {
    // Placeholder for map initialization
    // This is where Leaflet, Mapbox, or your custom engine will mount
    if (mapRef.current) {
      console.log("Map container ready:", mapRef.current);
    }
  }, []);

  return (
    <div style={{ width: "100%", height: "100vh", background: "#e5e5e5" }}>
      <h1 style={{ padding: "20px" }}>Map Module</h1>
      <div
        ref={mapRef}
        style={{
          width: "100%",
          height: "80vh",
          background: "#ccc",
          border: "2px solid #999",
        }}
      >
        {/* Map will render here */}
      </div>
    </div>
  );
}
