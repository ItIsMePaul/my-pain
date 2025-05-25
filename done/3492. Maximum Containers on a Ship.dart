class Solution {
  int maxContainers(int n, int w, int maxWeight) {
    return n * n * w >= maxWeight ? n * n : (maxWeight / w).floor();
  }
}
