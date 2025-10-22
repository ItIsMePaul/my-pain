function minFlips(a: number, b: number, c: number): number {
  let flippedBits: number = 0;
  let as: String = a.toString(2);
  let bs: String = b.toString(2);
  let cs: String = c.toString(2);
  let maxSize: number = Math.max(as.length, bs.length, cs.length);
  as = '0'.repeat(maxSize - as.length) + as;
  bs = '0'.repeat(maxSize - bs.length) + bs;
  cs = '0'.repeat(maxSize - cs.length) + cs;
  for (var i = 0; i < maxSize; i++) {
    if (cs[i] === '0') {
      if (cs[i] !== as[i]) {
        flippedBits++;
      }
      if (cs[i] !== bs[i]) {
        flippedBits++;
      }
    } else {
      if (cs[i] !== as[i] && cs[i] !== bs[i]) {
        flippedBits++;
      }
    }
  }
  return flippedBits;
};