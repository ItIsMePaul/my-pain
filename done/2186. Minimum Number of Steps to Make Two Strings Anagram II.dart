import 'dart:math';

class Solution {
  int minSteps(String s, String t) {
    Map<String, int> mapS = {};
    Map<String, int> mapT = {};
    for (var i = 0; i < s.length; i++) mapS[s[i]] = (mapS[s[i]] ?? 0) + 1;
    for (var i = 0; i < t.length; i++) mapT[t[i]] = (mapT[t[i]] ?? 0) + 1;
    int addToS = s.length;
    int addToT = t.length;
    for (var letter in mapT.keys) {
      addToT -= min(mapT[letter]!, (mapS[letter] ?? 0));
    }
    for (var letter in mapS.keys) {
      addToS -= min(mapS[letter]!, (mapT[letter] ?? 0));
    }
    return addToT + addToS;
  }
}
