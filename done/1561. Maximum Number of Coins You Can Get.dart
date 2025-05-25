class Solution {
  int maxCoins(List<int> piles) {
    piles.sort();
    int total = 0;
    int you = piles.length - 2;
    for (var i = 0; i < piles.length; i += 3) {
      total += piles[you];
      you -= 2;
    }
    return total;
  }
}
