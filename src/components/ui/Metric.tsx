export default function Metric({
  label,
  value,
  trend
}: {
  label: string;
  value: string | number;
  trend?: string;
}) {
  return (
    <div className="bg-black/30 border border-white/10 rounded-lg p-4">
      <div className="text-sm opacity-70">{label}</div>
      <div className="text-3xl font-bold mt-1">{value}</div>
      {trend && <div className="text-xs opacity-60 mt-1">{trend}</div>}
    </div>
  );
}