class Solution {
  int search(List<int> nums, int target) {
    int ans = 0;
    List<int> temp = List.from(nums);
    while (temp.length != 1 && temp.contains(target)) {
      List<int> temp1 = temp.sublist(0, temp.length ~/ 2);
      List<int> temp2 = temp.sublist(temp.length ~/ 2);
      if (temp1.contains(target)) {
        temp = temp1;
      } else {
        ans += temp.length ~/ 2;
        temp = temp2;
      }
    }
    return nums[ans] != target ? -1 : ans;
  }
}
