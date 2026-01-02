"use client";

import { useQuery } from "@tanstack/react-query";
import axios from "axios";

export default function useSensorQuery() {
  return useQuery({
    queryKey: ["sensors"],
    queryFn: async () => {
      const res = await axios.get("/api/sensors");
      return res.data;
    },
    refetchInterval: 5000
  });
}