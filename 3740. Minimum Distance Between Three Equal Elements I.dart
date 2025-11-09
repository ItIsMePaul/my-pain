class Solution {
  int minimumDistance(List<int> nums) {
    Map<int, List<int>> map = {};
    for (var i = 0; i < nums.length; i++) {
      map[nums[i]] = (map[nums[i]] ?? [])..add(i);
    }
    int result = -1;
    for (var key in map.keys) {
      if (map[key]!.length >= 3) {
        for (var i = 0; i < map[key]!.length - 2; i++) {
          for (var j = i + 1; j < map[key]!.length - 1; j++) {
            for (var k = j + 1; k < map[key]!.length; k++) {
              int temp =
                  (map[key]![i] - map[key]![j]).abs() +
                  (map[key]![j] - map[key]![k]).abs() +
                  (map[key]![k] - map[key]![i]).abs();
              if (result == -1 || result > temp) {
                result = temp;
              }
            }
          }
        }
      }
    }
    return result;
  }
}

void main() {
  Solution().minimumDistance([1, 2, 1, 1, 3]);
}
