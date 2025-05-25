class Solution {
  int rearrangeCharacters(String s, String target) {
    Map<int, int> targetCount = {};
    for (var code in target.codeUnits) {
      targetCount[code] = (targetCount[code] ?? 0) + 1;
    }
    Map<int, int> stringCount = {};
    for (var code in s.codeUnits) {
      stringCount[code] = (stringCount[code] ?? 0) + 1;
    }
    int ans = 100;
    for (var key in targetCount.keys) {
      if (!stringCount.containsKey(key)) return 0;
      int temp = stringCount[key]! ~/ targetCount[key]!;
      if (ans > temp) {
        ans = temp;
      }
    }
    return ans;
  }
}
