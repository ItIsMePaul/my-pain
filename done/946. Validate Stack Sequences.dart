class Solution {
  bool validateStackSequences(List<int> pushed, List<int> popped) {
    List<int> stack = [];
    int poppedIndex = 0;
    int pushedIndex = 0;
    while (pushedIndex < pushed.length || poppedIndex < popped.length) {
      if (stack.isNotEmpty && stack.last == popped[poppedIndex]) {
        poppedIndex++;
        stack.removeLast();
        continue;
      }
      if (pushedIndex < pushed.length) {
        stack.add(pushed[pushedIndex++]);
        continue;
      }
      break;
    }
    return stack.isEmpty;
  }
}

/// 1. create stack
/// 2. push value from pushed
/// 3. check if first popped match last value in stack
/// 4. if yes remove last value from stack
/// 5. if no repeat everything from step 2
/// 6. if stack in the end isn't empty return false opposite true
