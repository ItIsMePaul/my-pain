class RLEIterator {
  List<int> encoding;
  int i = 0;
  RLEIterator(this.encoding);

  int next(int n) {
    int result = -1;
    while (encoding.length > i && encoding[i] < n) {
      n -= encoding[i];
      i += 2;
    }
    if (encoding.length > i && encoding[i] >= n) {
      encoding[i] -= n;
      result = encoding[i + 1];
    }
    return result;
  }
}

/**
 * Your RLEIterator object will be instantiated and called as such:
 * RLEIterator obj = RLEIterator(encoding);
 * int param1 = obj.next(n);
 */
