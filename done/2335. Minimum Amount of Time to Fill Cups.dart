class Solution {
  int fillCups(List<int> amount) {
    amount.sort();
    if (amount[0] + amount[1] <= amount[2]) {
      return amount[2];
    }
    if (amount[0] + amount[1] > amount[2]) {
      return amount[2] + ((amount[1] + amount[0] - amount[2]) / 2).ceil();
    }
    return 0;
  }
}
