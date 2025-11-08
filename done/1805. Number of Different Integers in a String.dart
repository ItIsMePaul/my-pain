class Solution {
  int numDifferentIntegers(String word) {
    List<String> stack = [];
    Set<String> numbers = {};
    for (var i = 0; i < word.length; i++) {
      if (word[i].codeUnits[0] >= 'a'.codeUnits[0] &&
          word[i].codeUnits[0] <= 'z'.codeUnits[0]) {
        if (stack.isNotEmpty) {
          while (stack.length > 1 && stack.first == '0') {
            stack.removeAt(0);
          }
          numbers.add(stack.join());
          stack.clear();
        }
      } else {
        stack.add(word[i]);
      }
    }
    if (stack.isNotEmpty) {
      while (stack.length > 1 && stack.first == '0') {
        stack.removeAt(0);
      }
      numbers.add(stack.join());
    }
    return numbers.length;
  }
}
