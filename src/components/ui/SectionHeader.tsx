export default function SectionHeader({ title }: { title: string }) {
  return (
    <h1 className="text-2xl font-bold mb-6 border-b border-white/10 pb-2">
      {title}
    </h1>
  );
}