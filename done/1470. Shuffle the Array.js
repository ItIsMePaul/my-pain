/**
 * @param {number[]} nums
 * @param {number} n
 * @return {number[]}
 */
var shuffle = function (nums, n) {
  let array = [];
  for (let i = 0; i < nums.length / 2; i++) {
    array.push(nums[i]);
    array.push(nums[n + i]);
  }
  return array;
};

console.log(shuffle([1, 2, 3, 4], 1));
