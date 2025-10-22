import 'dart:collection';

class Solution {
  int getKth(int lo, int hi, int k) {
    int _getPower(int number) {
      int result = 0;
      while (number != 1) {
        if (number % 2 == 0) {
          number = number ~/ 2;
        } else {
          number = 3 * number + 1;
        }
        result++;
      }
      return result;
    }

    SplayTreeMap<int, SplayTreeSet<int>> result = SplayTreeMap();
    for (var i = lo; i <= hi; i++) {
      int power = _getPower(i);
      if (!result.containsKey(power)) result[power] = SplayTreeSet();
      result[power]!.add(i);
    }
    for (var key in result.keys) {
      if (result[key]!.length >= k) {
        return result[key]!.elementAt(k - 1);
      } else {
        k -= result[key]!.length;
      }
    }
    return -1;
  }
}
