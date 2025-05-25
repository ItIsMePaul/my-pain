class Solution {
  int isWinner(List<int> player1, List<int> player2) {
    int p1 = 0;
    int p2 = 0;
    int powerP1 = 0;
    int powerP2 = 0;
    for (var i = 0; i < player1.length; i++) {
      p1 += powerP1-- > 0 ? 2 * player1[i] : player1[i];
      p2 += powerP2-- > 0 ? 2 * player2[i] : player2[i];
      if (player1[i] == 10) powerP1 = 2;
      if (player2[i] == 10) powerP2 = 2;
    }
    if (p1 == p2) return 0;
    return p1 > p2 ? 1 : 2;
  }
}
