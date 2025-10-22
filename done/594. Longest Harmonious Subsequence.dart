import 'dart:collection';

class Solution {
  int findLHS(List<int> nums) {
    SplayTreeMap<int, int> numbers = SplayTreeMap();
    for (var i = 0; i < nums.length; i++) {
      numbers[nums[i]] = (numbers[nums[i]] ?? 0) + 1;
    }
    int size = 0;
    List<int> keys = numbers.keys.toList();
    for (var i = 1; i < keys.length; i++) {
      if ((keys[i - 1] - keys[i]).abs() == 1 &&
          numbers[keys[i - 1]]! + numbers[keys[i]]! > size) {
        size = numbers[keys[i - 1]]! + numbers[keys[i]]!;
      }
    }
    return size;
  }
}
