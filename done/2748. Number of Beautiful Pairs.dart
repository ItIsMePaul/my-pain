class Solution {
  int countBeautifulPairs(List<int> nums) {
    int gcd(int num1, int num2) {
      if (num1 > num2) {
        for (var i = num2; i > 0; i--) {
          if (num2 % i == 0 && num1 % i == 0) {
            return i;
          }
        }
      } else {
        for (var i = num1; i > 0; i--) {
          if (num2 % i == 0 && num1 % i == 0) {
            return i;
          }
        }
      }
      return 0;
    }

    Set<List<int>> ans = {};

    for (var i = 0; i < nums.length; i++) {
      for (var j = i + 1; j < nums.length; j++) {
        int n1 = int.parse(nums[i].toString()[0]), n2 = nums[j] % 10;
        if (gcd(n1, n2) == 1) {
          ans.add([n1, n2]);
        }
      }
    }

    print(ans);
    return ans.length;
  }
}
