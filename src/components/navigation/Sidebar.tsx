"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";

const navItems = [
  { name: "Dashboard", path: "/dashboard" },
  { name: "Weather", path: "/weather" },
  { name: "Irrigation", path: "/irrigation" },
  { name: "Apiary", path: "/apiary" },
  { name: "Orchard", path: "/orchard" },
  { name: "Livestock", path: "/livestock" },
  { name: "Systems", path: "/systems" },
];

export default function Sidebar() {
  const pathname = usePathname();

  return (
    <aside className="w-64 bg-brand-sidebar p-4 flex flex-col gap-4">
      <h2 className="text-xl font-bold">Homestead OS</h2>

      <nav className="flex flex-col gap-2">
        {navItems.map((item) => (
          <Link
            key={item.path}
            href={item.path}
            className={`p-2 rounded ${
              pathname === item.path
                ? "bg-brand-accent text-black"
                : "hover:bg-brand-accent/20"
            }`}
          >
            {item.name}
          </Link>
        ))}
      </nav>
    </aside>
  );
}
