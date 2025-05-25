class Solution {
  List<int> sortArray(List<int> nums) {
    List<int> negative = [];
    List<int> positive = [];
    for (var i = 0; i < nums.length; i++) {
      if (nums[i].isNegative) {
        negative.add(nums[i].abs());
      } else {
        positive.add(nums[i].abs());
      }
    }
    negative =
        radixSort(negative).map((num) => -num).toList().reversed.toList();
    positive = radixSort(positive);
    return [...negative, ...positive];
  }

  List<int> radixSort(List<int> nums) {
    if (nums.length <= 0) return nums;
    int maxValue = nums.reduce(
      (value, element) => value.abs() > element.abs() ? value : element,
    );
    print(maxValue);
    List<List<int>> radixArray = [[], [], [], [], [], [], [], [], [], []];
    int exp = 1;
    while ((maxValue / exp).floor() > 0) {
      while (nums.isNotEmpty) {
        int value = nums.removeLast();
        radixArray[(value ~/ exp) % 10].add(value);
      }
      for (var bucket in radixArray) {
        while (bucket.isNotEmpty) nums.add(bucket.removeLast());
      }
      exp *= 10;
    }
    return nums;
  }
}

void main() {
  List<int> nums = [-5, -2, -10, -1, 20, 45, -11];
  Solution solution = Solution();
  List<int>? result = solution.sortArray(nums);
  print(result); // Output: [1, 2, 3, 5]
}
