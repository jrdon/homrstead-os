export default function MainContent({
  children
}: {
  children: React.ReactNode;
}) {
  return (
    <main className="flex-1 overflow-y-auto p-6 bg-brand-panel">
      {children}
    </main>
  );
}