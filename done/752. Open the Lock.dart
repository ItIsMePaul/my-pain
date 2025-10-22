import 'dart:math';

class Solution {
  int longestPalindrome(List<String> words) {
    int answer = 0;
    Map<String, int> map = {};
    for (var word in words) {
      map[word] = (map[word] ?? 0) + 1;
    }
    print(map);
    bool middle = false;
    Set<String> usedKeys = {};
    for (var key in map.keys) {
      if (key[0] == key[1]) {
        if (!middle && map[key]! % 2 == 1) {
          answer += map[key]! ~/ 2 * 4 + 2;
          middle = true;
        } else {
          answer += map[key]! ~/ 2 * 4;
        }
      } else {
        if (map.containsKey(key[1] + key[0]) && !usedKeys.contains(key)) {
          int temp = min(map[key]!, map[key[1] + key[0]]!);
          answer += temp * 4;
          map.remove(key);
          map.remove(key[1] + key[0]);
        }
      }
      usedKeys.add(key);
      usedKeys.add(key[1] + key[0]);
    }
    return answer;
  }
}
