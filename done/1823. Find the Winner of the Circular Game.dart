class Solution {
  int findTheWinner(int n, int k) {
    List<int> players = List.generate(n, (int index) => index + 1);
    int pos = 0;
    while (players.length > 1) {
      pos = (pos + k - 1) % players.length;
      players.removeAt(pos);
    }
    return players[0];
  }
}
