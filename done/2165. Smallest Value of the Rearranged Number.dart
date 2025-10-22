import 'dart:collection';

class Solution {
  int smallestNumber(int num) {
    SplayTreeMap<String, int> map = SplayTreeMap();
    if (num.abs() < 10) return num;
    bool negative = false;
    for (var digit in num.toString().split('')) {
      if (digit == '-') {
        negative = true;
        continue;
      }
      map[digit] = (map[digit] ?? 0) + 1;
    }
    int zeros = map.remove('0') ?? 0;
    StringBuffer result = StringBuffer();
    if (negative) {
      result.write('-');
      for (var key in map.keys.toList().reversed) {
        result.write('$key' * map[key]!);
      }
      result.write('0' * zeros);
    } else {
      result.write(map.firstKey());
      map[map.firstKey()!] = map[map.firstKey()]! - 1;
      result.write('0' * zeros);
      for (var key in map.keys) {
        result.write('$key' * map[key]!);
      }
    }
    return int.parse(result.toString());
  }
}
