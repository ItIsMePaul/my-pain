class Solution {
  List<int> circularGameLosers(int n, int k) {
    List<int> losers = List.generate(n - 1, (int index) => index + 2);
    List<int> winners = [1];
    List<int> players = List.generate(n, (int index) => index + 1);
    int position = 0;
    int move = 1;
    while (true) {
      position = position + move * k >= players.length
          ? (position + move * k) % players.length
          : position + move * k;
      move++;
      if (winners.contains(players[position])) {
        break;
      } else {
        winners.add(players[position]);
        losers.removeWhere((player) => player == players[position]);
      }
    }
    return losers;
  }
}
