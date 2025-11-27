class Solution {
  bool canAliceWin(List<int> nums) {
    int single = 0;
    int double = 0;
    for (var e in nums) {
      if (e > 9) {
        double += e;
      } else {
        single += e;
      }
    }
    if (single > double || double > single) {
      return true;
    } else {
      return false;
    }
  }
}
