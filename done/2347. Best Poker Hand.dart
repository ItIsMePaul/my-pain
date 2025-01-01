class Solution {
  String bestHand(List<int> ranks, List<String> suits) {
    if (suits.toSet().length == 1) return "Flush";
    Map<int, int> countRanks = {};
    int ans = 1;
    for (var i = 0; i < ranks.length; i++) {
      if (countRanks.containsKey(ranks[i])) {
        countRanks[ranks[i]] = countRanks[ranks[i]]! + 1;
        if (countRanks[ranks[i]]! > ans) {
          ans = countRanks[ranks[i]]!;
        }
      } else {
        countRanks[ranks[i]] = 1;
      }
    }
    if (ans >= 2) {
      return ans > 2 ? "Three of a Kind" : "Pair";
    }
    return "High Card";
  }
}
