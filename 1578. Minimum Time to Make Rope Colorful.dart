class Solution {
  int minCost(String colors, List<int> neededTime) {
    int result = 0;
    int max = -1;
    for (var i = 0; i < colors.length - 1; i++) {
      if (colors[i] == colors[i + 1]) {
        int min = (max != -1 ? max : neededTime[i]) > neededTime[i + 1]
            ? neededTime[i + 1]
            : (max != -1 ? max : neededTime[i]);
        max = (max != -1 ? max : neededTime[i]) > neededTime[i + 1]
            ? (max != -1 ? max : neededTime[i])
            : neededTime[i + 1];
        result += min;
      } else {
        max = -1;
      }
    }
    return result;
  }
}
