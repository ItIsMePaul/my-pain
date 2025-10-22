class Solution {
  List<int> numOfBurgers(int tomatoSlices, int cheeseSlices) {
    if (tomatoSlices % 2 == 1 || cheeseSlices > tomatoSlices ~/ 2) {
      return [];
    } else {
      int sb = 2 * cheeseSlices - tomatoSlices ~/ 2;
      int jb = -cheeseSlices + tomatoSlices ~/ 2;
      if (sb < 0 || jb < 0) return [];
      return [jb, sb];
    }
  }
}
