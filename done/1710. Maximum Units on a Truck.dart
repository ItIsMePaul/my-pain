class Solution {
  int maximumUnits(List<List<int>> boxTypes, int truckSize) {
    int ans = 0;
    while (truckSize > 0 && boxTypes.isNotEmpty) {
      int bigestBox = 0;
      int pos = 0;
      for (var i = 0; i < boxTypes.length; i++) {
        if (boxTypes[i][1] > bigestBox) {
          bigestBox = boxTypes[i][1];
          pos = i;
        }
      }
      while (boxTypes[pos][0] > 0 && truckSize > 0) {
        ans += boxTypes[pos][1];
        boxTypes[pos][0]--;
        truckSize--;
      }
      boxTypes.removeAt(pos);
    }
    return ans;
  }
}
