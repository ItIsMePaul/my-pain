class NumArray {
  final List<int> nums;
  NumArray(this.nums);

  int sumRange(int left, int right) {
    int sum = 0;
    for (var i = left; i <= right; i++) {
      sum += nums[i];
    }
    return sum;
  }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * NumArray obj = NumArray(nums);
 * int param1 = obj.sumRange(left,right);
 */