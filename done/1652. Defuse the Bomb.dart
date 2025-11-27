class Solution {
  List<int> decrypt(List<int> code, int k) {
    List<int> ans = [];
    int positiveK(List<int> code, int k, int pos) {
      int i = 0;
      int ans = 0;
      while (i < k) {
        pos++;
        if (pos >= code.length) {
          pos = 0;
        }
        ans += code[pos];
        i++;
      }
      return ans;
    }

    int negativeK(List<int> code, int k, int pos) {
      int i = 0;
      int ans = 0;
      while (i < -k) {
        pos--;
        if (pos < 0) {
          pos = code.length - 1;
        }
        ans += code[pos];
        i++;
      }
      return ans;
    }

    if (k > 0) {
      for (var i = 0; i < code.length; i++) {
        ans.add(positiveK(code, k, i));
      }
    } else if (k < 0) {
      for (var i = 0; i < code.length; i++) {
        ans.add(negativeK(code, k, i));
      }
    } else {
      for (var i = 0; i < code.length; i++) {
        ans.add(0);
      }
    }
    return ans;
  }
}
