class Solution {
  int countDistinctIntegers(List<int> nums) {
    List<int> temp = [];
    for (var num in nums) {
      temp.add(int.parse(num.toString().split('').reversed.join('')));
    }
    temp.addAll(nums);
    return temp.toSet().length;
  }
}
