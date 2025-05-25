class Solution {
  int numOfSubarrays(List<int> arr) {
    int ans = 0;
    for (var i = 0; i < arr.length; i++) {
      for (var j = i; j < arr.length; j++) {
        int sum = 0;
        for (var k = i; k <= j; k++) sum += arr[k];
        if (sum % 2 == 1) ans++;
      }
    }
    return ans;
  }
}


// TLE
/*
  int numOfSubarrays(List<int> arr) {
    int ans = 0;
    for (var i = 0; i < arr.length; i++) {
      for (var j = i; j < arr.length; j++) {
        int sum = 0;
        for (var k = i; k <= j; k++) sum += arr[k];
        if (sum % 2 == 1) ans++;
      }
    }
    return ans;
  }
*/
