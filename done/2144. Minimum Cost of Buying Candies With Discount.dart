class Solution {
  int minimumCost(List<int> cost) {
    if (cost.length < 3) {
      return cost.length == 2 ? cost[0] + cost[1] : cost[0];
    }
    cost.sort();
    int ans = 0;
    int j = 0;
    for (var i = cost.length - 1; i >= 0; i--) {
      if (j <= 2) {
        ans += cost[i];
        j++;
      } else {
        j = 0;
      }
    }
    return ans;
  }
}
