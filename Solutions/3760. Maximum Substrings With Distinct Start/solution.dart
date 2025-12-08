class Solution {
  int maxDistinct(String s) {
    return s.split('').toSet().length;
  }
}
