class Solution {
  int minMirrorPairDistance(List<int> nums) {
    int result = -1;
    Map<int, List<int>> mapIndex = {};
    for (var i = 0; i < nums.length; i++) {
      if (mapIndex.containsKey(nums[i]))
        mapIndex[nums[i]]!.add(i);
      else
        mapIndex[nums[i]] = [i];
    }
    for (var i = 0; i < nums.length; i++) {
      int temp = int.parse(nums[i].toString().split('').reversed.join());
      for (int j in mapIndex[temp] ?? []) {
        if (i < j) {
          int tempResult = (i - j).abs();
          if (tempResult < result || result == -1) result = tempResult;
          if (result == 1) return 1; // all magic does that row XD
        }
      }
    }
    return result;
  }
}
