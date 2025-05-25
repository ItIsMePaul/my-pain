class Solution {
  int minOperations(List<int> n, int k) {
    return n.fold(0, (previousValue, element) => previousValue + element) % k;
  }
}
