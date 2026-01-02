import clsx from "clsx";

export default function Badge({
  label,
  type = "default"
}: {
  label: string;
  type?: "default" | "success" | "warning" | "danger";
}) {
  const colors = {
    default: "bg-white/10 text-white",
    success: "bg-green-600/40 text-green-200",
    warning: "bg-yellow-600/40 text-yellow-200",
    danger: "bg-red-600/40 text-red-200"
  };

  return (
    <span
      className={clsx(
        "px-2 py-1 rounded text-xs font-semibold",
        colors[type]
      )}
    >
      {label}
    </span>
  );
}