class Solution {
  int maxLength(List<int> nums) {
    int prodMultiple(List<int> arr) {
      int ans = arr[0];
      for (var i = 1; i < arr.length; i++) {
        ans = ans * arr[i];
      }
      return ans;
    }

    int gcdMultiple(List<int> arr) {
      int ans = arr[0];
      for (var i = 1; i < arr.length; i++) {
        ans = ans.gcd(arr[i]);
      }
      return ans;
    }

    int lcmMultiple(List<int> arr) {
      int ans = arr[0];
      for (var i = 1; i < arr.length; i++) {
        ans = (ans * arr[i]).abs() ~/ ans.gcd(arr[i]);
      }
      return ans;
    }

    int ans = 0;
    int size = 2;
    while (size <= nums.length) {
      for (var i = 0; i <= nums.length - size; i++) {
        List<int> temp = nums.sublist(i, i + size);

        int prod = prodMultiple(temp);
        int gcd = gcdMultiple(temp);
        int lcm = lcmMultiple(temp);
        if (prod == gcd * lcm) {
          ans = size;
          break;
        }
      }
      size++;
    }
    return ans;
  }
}
