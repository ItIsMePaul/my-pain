class Solution {
  int heightChecker(List<int> heights) {
    List<int> hs = [];
    hs.addAll(heights);
    int result = 0;
    hs.sort();
    for (var i = 0; i < heights.length; i++) {
      if (hs[i] != heights[i]) {
        result++;
      }
    }
    return result;
  }
}
