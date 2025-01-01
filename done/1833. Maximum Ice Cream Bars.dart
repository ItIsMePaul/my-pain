class Solution {
  int maxIceCream(List<int> costs, int coins) {
    costs.sort();
    int ans = 0;
    for (var e in costs) {
      if (coins > e) {
        coins -= e;
        ans++;
      } else {
        break;
      }
    }
    return ans;
  }
}
