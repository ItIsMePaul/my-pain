class Solution {
  public int fillCups(int[] amount) {
    Arrays.sort(amount);
    if (amount[0] + amount[1] <= amount[2]) {
      return amount[2];
    }
    if (amount[0] + amount[1] > amount[2]) {
      return amount[2] + (int) Math.ceil((amount[1] + amount[0] - amount[2]) / 2.0);
    }
    return 0;
  }
}