class Solution {
  int finalValueAfterOperations(List<String> operations) {
    int x = 0;
    for (var e in operations) {
      if ('++X' == e || 'X++' == e) {
        x++;
      } else {
        x--;
      }
    }
    return x;
  }
}
