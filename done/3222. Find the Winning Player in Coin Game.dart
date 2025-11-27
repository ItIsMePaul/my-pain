class Solution {
  String losingPlayer(int x, int y) {
    bool winner = false;
    while (x >= 1 && y >= 4) {
      x--;
      y -= 4;
      winner = !winner;
    }
    if (winner) {
      return 'Alice';
    } else {
      return 'Bob';
    }
  }
}
