class Solution {
  int minimumCardPickup(List<int> cards) {
    Map<int, int> map = {};
    int min = 100001;
    for (var i = 0; i < cards.length; i++) {
      if (map.containsKey(cards[i])) {
        int temp = i - map[cards[i]]! + 1;
        if (temp < min) {
          min = temp;
        }
      }
      map[cards[i]] = i;
    }
    return min == 100001 ? -1 : min;
  }
}
