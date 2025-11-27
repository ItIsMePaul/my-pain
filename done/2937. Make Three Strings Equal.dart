class Solution {
  int findMinimumOperations(String s1, String s2, String s3) {
    bool equalStrings(String s1, String s2, String s3) {
      if (s1 == s2 && s2 == s3) {
        return true;
      } else {
        return false;
      }
    }

    if (s1[0] != s2[0] || s2[0] != s3[0] || s3[0] != s1[0]) {
      return -1;
    }

    int ans = 0;
    while (!equalStrings(s1, s2, s3)) {
      if (s1.length >= s2.length && s1.length >= s3.length) {
        s1 = s1.replaceRange(s1.length - 1, s1.length, ' ').trim();
        ans++;
      }
      if (equalStrings(s1, s2, s3)) break;
      if (s2.length >= s1.length && s2.length >= s3.length) {
        s2 = s2.replaceRange(s2.length - 1, s2.length, ' ').trim();
        ans++;
      }
      if (equalStrings(s1, s2, s3)) break;
      if (s3.length >= s1.length && s3.length >= s2.length) {
        s3 = s3.replaceRange(s3.length - 1, s3.length, ' ').trim();
        ans++;
      }
    }

    return ans;
  }
}
