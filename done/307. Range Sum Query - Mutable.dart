class NumArray {
  late List<int> memory;
  NumArray(List<int> nums) {
    memory = nums;
  }

  void update(int index, int val) {
    memory[index] = val;
  }

  int sumRange(int left, int right) {
    int sum = 0;
    for (var i = left; i <= right; i++) {
      sum += memory[i];
    }
    return sum;
  }
}