class Solution {
  int maxDistance(List<int> colors) {
    int arrSize = colors.length;
    if (colors.first != colors.last) return arrSize - 1;
    for (var i = 0; i < arrSize; i++) {
      if (colors.first != colors[arrSize - 1 - i] || colors.last != colors[i])
        return arrSize - 1 - i;
    }
    return -1;
  }
}
