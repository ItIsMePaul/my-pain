/**
 * @param {number[]} nums
 * @param {Function} fn
 * @param {number} init
 * @return {number}
 */
var reduce = function(nums, fn, init) {
    let accum = init;
    for (const num of nums) {
        accum = fn(accum, num);
    }
    return accum;
};