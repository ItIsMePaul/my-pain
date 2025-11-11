function numberOfLines(widths: number[], s: string): number[] {
  let size: number = 0;
  let lines: number = 1;
  for (let i = 0; i < s.length; i++) {
    if (size + widths[s.charCodeAt(i) - 97] <= 100) {
      size += widths[s.charCodeAt(i) - 97];
    } else {
      lines++;
      size = widths[s.charCodeAt(i) - 97];
    }
  }
  return [lines, size];
};