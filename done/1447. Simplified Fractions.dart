class Solution {
  List<String> simplifiedFractions(int n) {
    int _GCD(int a, int b) {
      if (a == 0) {
        return b;
      }
      return _GCD(b % a, a);
    }

    Set<String> result = {};
    for (var j = 1; j < n; j++) {
      for (var i = j + 1; i <= n; i++) {
        int temp = _GCD(j, i);
        result.add('${j ~/ temp}/${i ~/ temp}');
      }
    }
    return result.toList();
  }
}

void main() {
  print(Solution().simplifiedFractions(5));
}
