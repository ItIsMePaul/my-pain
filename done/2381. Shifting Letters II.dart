class Solution {
  String shiftingLetters(String s, List<List<int>> shifts) {
    final n = s.length;
    final diff = List.filled(n + 1, 0);

    for (final shift in shifts) {
      diff[shift[0]] += shift[2] == 1 ? 1 : -1;
      diff[shift[1] + 1] -= shift[2] == 1 ? 1 : -1;
    }

    for (var i = 1; i < n; i++) {
      diff[i] += diff[i - 1];
    }

    final codes = List<int>.filled(n, 0);
    for (var i = 0; i < n; i++) {
      codes[i] =
          ((s.codeUnitAt(i) - 'a'.codeUnitAt(0) + diff[i]) % 26 + 26) % 26 +
              'a'.codeUnitAt(0);
    }

    return String.fromCharCodes(codes);
  }
}
