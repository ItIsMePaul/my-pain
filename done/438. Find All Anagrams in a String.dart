class Solution {
  List<int> findAnagrams(String s, String p) {
    bool _mapsEqual(Map? map1, Map? map2) {
      if (map1 == null && map2 == null) return true;
      if (map1 == null || map2 == null) return false;
      if (map1.length != map2.length) return false;
      for (var key in map1.keys) {
        if (!map2.containsKey(key) || map1[key] != map2[key]) return false;
      }
      return true;
    }

    if (p.length > s.length) return [];
    Map<String, int> mapP = {};
    Map<String, int> mapS = {};
    List<int> result = [];
    for (var i = 0; i < p.length; i++) {
      mapP[p[i]] = (mapP[p[i]] ?? 0) + 1;
      mapS[s[i]] = (mapS[s[i]] ?? 0) + 1;
    }
    if (_mapsEqual(mapS, mapP)) result.add(0);
    for (var i = 1; i < s.length - p.length; i++) {
      mapS[s[i - 1]] = mapS[s[i - 1]]! - 1;
      mapS[s[p.length + i - 1]] = (mapS[s[p.length + i - 1]] ?? 0) + 1;
      if (mapS[s[i - 1]] == 0) {
        mapS.remove(s[i - 1]);
      }
      if (_mapsEqual(mapS, mapP)) result.add(i);
    }
    return result;
  }
}