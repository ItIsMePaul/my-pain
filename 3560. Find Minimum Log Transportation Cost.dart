class Solution {
  int minCuttingCost(int n, int m, int k) {
    int cost = 0;
    if (n > k) {
      if (n % k == 0) cost += (n ~/ 2) * (n ~/ 2);
      cost += k * (n % k);
    } 
    if (m > k) {
      if (m % k == 0) cost += (m ~/ 2) * (n ~/ 2);
      cost += k * (n % k);
    } 
    return cost;
  }
}