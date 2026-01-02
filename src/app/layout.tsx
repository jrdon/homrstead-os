import "./globals.css";
import { ReactNode } from "react";

export const metadata = {
  title: "Homestead OS",
  description: "Command Center for Regenerative Homesteads"
};

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="en">
      <body className="min-h-screen flex flex-col bg-brand-bg text-white">
        {children}
      </body>
    </html>
  );
}
