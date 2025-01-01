class Solution {
  bool isHappy(int n) {
    List<int> nums = [n];
    while (n != 1) {
      String tempN = n.toString();
      int tempNewNum = 0;
      for (var i = 0; i < tempN.length; i++) {
        int num = int.parse(tempN[i]);
        tempNewNum += num * num;
      }
      if (nums.contains(tempNewNum)) {
        return false;
      } else {
        nums.add(tempNewNum);
      }
      n = tempNewNum;
    }
    return true;
  }
}
