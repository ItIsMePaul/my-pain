class Solution {
  int minOperations(List<String> logs) {
    int result = 0;
    for (var e in logs) {
      switch (e) {
        case './':
          continue;
        case '../':
          if (result > 0) {
            result--;
          }
          continue;
        default:
          result++;
      }
    }
    return result;
  }
}
