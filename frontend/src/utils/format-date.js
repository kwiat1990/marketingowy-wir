export default function getFormattedDate(dateString) {
  const date = new Date(dateString);
  return {
    datetime: `${date.getFullYear()}-${date.getMonth() + 1}-${date.getDate()}`,
    date: date.toLocaleDateString("pl-PL", {
      day: "numeric",
      month: "long",
      year: "numeric",
    }),
  };
}