class Solution {
  int minFlips(String target) {
    bool state = false;
    int result = 0;
    for (var i = 0; i < target.length; i++) {
      if ((state ? '1' : '0') != target[i]) {
        state = !state;
        result++;
      }
    }
    return result;
  }
}
