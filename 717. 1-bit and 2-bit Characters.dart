class Solution {
  bool isOneBitCharacter(List<int> bits) {
    if (bits.last == 1) return false;
    List<int> stack = [];
    for (var i = 0; i < bits.length - 1; i++) {
      stack.add(bits[i]);
      if (stack.length == 1) {
        if (stack[0] == 0) {
          stack.clear();
        }
      }
      if (stack.length == 2) {
        if (stack[0] == 1 && (stack[1] == 0 || stack[1] == 1)) {
          stack.clear();
        }
      }
      if (stack.length > 2) {
        return false;
      }
    }
    return stack.isEmpty;
  }
}
