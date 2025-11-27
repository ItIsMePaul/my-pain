class Solution {
  int distanceTraveled(int mainTank, int additionalTank) {
    int ans = 0;
    while (mainTank >= 0) {
      if (mainTank >= 5 && additionalTank > 0) {
        ans += 50;
        additionalTank--;
        mainTank -= 4;
      } else {
        ans += mainTank * 10;
        mainTank -= mainTank;
      }
    }
    return ans;
  }
}
