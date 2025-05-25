class Solution {
  int findClosest(int x, int y, int z) {
    int person1 = (x - z).abs();
    int person2 = (y - z).abs();
    if (person1 < person2) {
      return 1;
    } else if (person2 < person1) {
      return 2;
    } else {
      return 0;
    }
  }
}
