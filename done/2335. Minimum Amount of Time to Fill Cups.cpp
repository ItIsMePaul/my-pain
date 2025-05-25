class Solution {
public:
  int fillCups(vector<int>& amount) {
    sort(amount.begin(), amount.end());
    if (amount[0] + amount[1] <= amount[2]) {
      return amount[2];
    }
    if (amount[0] + amount[1] > amount[2]) {
      return amount[2] + ceil((amount[1] + amount[0] - amount[2]) / 2.0);
    }
    return 0;
  }
};