class Solution {
  String decodeString(String s) {
    List<String> stack = [];
    List<int> numbers = [];
    StringBuffer number = StringBuffer();
    for (var i = 0; i < s.length; i++) {
      String temp = s[i];
      if (temp.codeUnits[0] >= 48 && temp.codeUnits[0] <= 57) {
        number.write(temp);
      } else {
        if (temp == ']') {
          List<String> temp = [];
          while (stack.last != '[') {
            temp.add(stack.removeLast());
          }
          stack.removeLast();
          stack.add(temp.reversed.join() * numbers.removeLast());
        } else {
          stack.add(temp);
          if (number.isNotEmpty) {
            numbers.add(int.parse(number.toString()));
            number.clear();
          }
        }
      }
    }
    return stack.join();
  }
}

void main() {
  Solution().decodeString("3[z]2[2[y]pq4[2[jk]e1[f]]]ef");
}
