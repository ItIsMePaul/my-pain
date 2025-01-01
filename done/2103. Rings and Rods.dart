class Solution {
  int countPoints(String rings) {
    Map<int, Set<String>> map = {};
    for (var i = 0; i < rings.length; i += 2) {
      String tempColour = rings[i];
      int tempNumber = int.parse(rings[i + 1]);
      if (map.containsKey(tempNumber)) {
        map[tempNumber]!.add(tempColour);
      } else {
        map[tempNumber] = {tempColour};
      }
    }
    int ans = 0;
    for (var key in map.keys) {
      if (map[key]!.length == 3) {
        ans++;
      }
    }
    return ans;
  }
}
