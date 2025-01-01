class Solution {
  int winningPlayerCount(int n, List<List<int>> pick) {
    List<List<int>> players = List.generate(n, (int index) => []);
    Set<int> winner = {};
    print(players);
    for (var e in pick) {
      players[e[0]].add(e[1]);
    }
    print(players);
    for (var i = 0; i < players.length; i++) {
      if (players[i].isEmpty) {
        continue;
      } else {
        Map<int, int> balls = {};
        for (var ballColour in players[i]) {
          balls[ballColour] =
              balls[ballColour] == null ? 1 : balls[ballColour]! + 1;
          if (balls[ballColour]! >= i + 1) {
            winner.add(i);
          }
        }
      }
    }
    return winner.length;
  }
}
