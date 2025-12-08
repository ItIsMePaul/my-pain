import 'dart:collection';

extension IntExtensions on int {
  int reversedByBinary() {
    return int.parse(this.toRadixString(2).split('').reversed.join(), radix: 2);
  }
}

class Solution {
  List<int> sortByReflection(List<int> nums) {
    SplayTreeMap<int, List<int>> storage = SplayTreeMap();
    Map<int, int> map = {};
    for (var i = 0; i < nums.length; i++) {
      if (!map.containsKey(nums[i])) {
        map[nums[i]] = nums[i].reversedByBinary();
      }
      int reversed = map[nums[i]]!;
      if (storage.containsKey(reversed)) {
        storage[reversed]!.add(nums[i]);
      } else {
        storage[reversed] = [nums[i]];
      }
    }
    List<int> result = [];
    for (var key in storage.keys) {
      result.addAll(storage[key]!..sort());
    }
    return result;
  }
}
