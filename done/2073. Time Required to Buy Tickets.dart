class Solution {
  int timeRequiredToBuys(List<int> tickets, int k) {
    int result = tickets[k] * tickets.length;
    int temp = tickets[k];
    for (var i = 0; i < tickets.length; i++) {
      tickets[i] -= temp;
      if (tickets[i] < 0) {
        result += tickets[i];
      }
    }
    return result;
  }

  int timeRequiredToBuy(List<int> tickets, int k) {
    int result = 0;
    while1:
    while (tickets[k] > 0) {
      for (var i = 0; i < tickets.length; i++) {
        if (tickets[k] <= 0) {
          break while1;
        }
        if (tickets[i] == 0) {
          if (i < k) {
            k--;
          }
          tickets.removeAt(i);
          i--;
          continue;
        }
        result++;
        tickets[i]--;
      }
    }
    return result;
  }
}
