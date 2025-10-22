class Solution {
  bool isValid(String s) {
    List<String> stack = [];
    for (var i = 0; i < s.length; i++) {
      stack.add(s[i]);
      int n = stack.length;
      if (n > 2 &&
          stack[n - 1] == 'c' &&
          stack[n - 2] == 'b' &&
          stack[n - 3] == 'a') {
        stack.removeRange(n - 3, n);
      }
    }
    return stack.isEmpty;
  }
}

/// 1. create stack
/// 2. start adding chars to stack
/// 3. track 3 last charecters if meet 'abc' remove three last charecters
/// otherwise just keep adding letters
/// 4. if stack isn't empty return false otherwise return true

void main() {
  print(Solution().isValid('abcabcaaabcbcbc'));
}
