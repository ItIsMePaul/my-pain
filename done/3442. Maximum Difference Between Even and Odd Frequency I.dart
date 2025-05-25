class Solution {
  int maxDifference(String s) {
    Map<String, int> map = {};
    for (var i = 0; i < s.length; i++) {
      map[s[i]] = (map[s[i]] ?? 0) + 1;
    }
    int biggestEven = 0;
    int biggestOdd = 0;
    for (var n in map.values) {
      if (n % 2 == 0 && biggestEven < n) biggestEven = n;
      if (n % 2 == 1 && biggestOdd < n) biggestOdd = n;
    }
    return 0;
  }
}
