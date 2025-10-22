class Solution {
  String reverseParentheses(String s) {
    List<String> mainStack = [];
    List<String> tempStack = [];
    List<int> position = [];
    int index = 0;

    while (index < s.length) {
      if (s[index] == ')') {
        tempStack.addAll(mainStack.sublist(position.last + 1).reversed);
        mainStack.removeRange(position.removeLast(), mainStack.length);
        mainStack.addAll(tempStack);
        tempStack.clear();
        index++;
      } else {
        if (s[index] == '(') {
          position.add(mainStack.length);
        }
        mainStack.add(s[index]);
        index++;
      }
    }
    return mainStack.join();
  }
}

void main() {
  print(Solution().reverseParentheses('ta()usw((((a))))'));
}

/// 1. create main and temp stack and open parentheses tracker
/// 2. add everything to main stack until we meet close parentheses aslo add position each open parenthes
/// 3. remove letter from main stack and put them into temp stack (reversed) until we meet open parenthes and remove last item from position
/// 4. join main stack and return it
