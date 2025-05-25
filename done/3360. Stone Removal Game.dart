class Solution {
  bool canAliceWin(int n) {
    int nextAmountRemove = 10;
    bool winner = false;
    while (n >= nextAmountRemove) {
      n -= nextAmountRemove;
      nextAmountRemove--;
      winner = !winner;
    }
    return winner;
  }
}
