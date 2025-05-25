class Solution {
  String customSortString(String order, String s) {
    Map<String, int> map = {};
    StringBuffer result = StringBuffer();
    for (var i = 0; i < s.length; i++) map[s[i]] = (map[s[i]] ?? 0) + 1;
    for (var i = 0; i < order.length; i++)
      result.write(order[i] * (map.remove(order[i]) ?? 0));
    for (var key in map.keys) result.write(key * map[key]!);
    return result.toString();
  }
}
