class Solution {
  bool checkInclusion(String s1, String s2) {
    bool checkIfIncludeT(Map<String, int> mapS1, Map<String, int> mapS2) {
      for (var key in mapS1.keys) {
        if (!mapS2.containsKey(key)) return false;
        if (mapS2[key]! != mapS1[key]!) return false;
      }
      return true;
    }

    if (s2.length < s1.length) return false;
    Map<String, int> mapS1 = {};
    for (var i = 0; i < s1.length; i++) mapS1[s1[i]] = (mapS1[s1[i]] ?? 0) + 1;
    Map<String, int> mapS2 = {};
    for (var i = 0; i < s1.length; i++) mapS2[s2[i]] = (mapS2[s2[i]] ?? 0) + 1;
    if (checkIfIncludeT(mapS1, mapS2)) {
      return true;
    }
    for (var j = s1.length; j < s2.length; j++) {
      mapS2[s2[j]] = (mapS2[s2[j]] ?? 0) + 1;
      mapS2[s2[j - s1.length]] = mapS2[s2[j - s1.length]]! - 1;
      if (checkIfIncludeT(mapS1, mapS2)) {
        return true;
      }
    }
    return false;
  }
}
