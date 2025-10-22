function minPairSum(nums: number[]): number {
  nums.sort((a, b) => a - b);
  let result: number = 0;
  for (var i = 0; i < nums.length / 2; i++) {
    let temp: number = nums[i] + nums[nums.length - i - 1];
    if (temp > result) {
      result = temp;
    }
  }
  return result;
};