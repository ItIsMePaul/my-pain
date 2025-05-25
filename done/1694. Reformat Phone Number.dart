class Solution {
  String reformatNumber(String number) {
    List<String> numbers = [];
    for (var i = 0; i < number.length; i++) {
      if (number[i] != '-' && number[i] != ' ') {
        numbers.add(number[i]);
      }
    }
    StringBuffer result = StringBuffer();
    int mode = numbers.length % 3;
    if (mode == 0) {
      for (var i = 0; i < numbers.length; i++) {
        if (i != 0 && i % 3 == 0) {
          result.write('-');
        }
        result.write(numbers[i]);
      }
    }
    if (mode == 1) {
      for (var i = 0; i < numbers.length - 4; i++) {
        if (i != 0 && i % 3 == 0) {
          result.write('-');
        }
        result.write(numbers[i]);
      }

      result.write('-');
      result.write(numbers[numbers.length - 4]);
      result.write(numbers[numbers.length - 3]);
      result.write('-');
      result.write(numbers[numbers.length - 2]);
      result.write(numbers[numbers.length - 1]);
    }
    if (mode == 2) {
      for (var i = 0; i < numbers.length - 2; i++) {
        if (i != 0 && i % 3 == 0) {
          result.write('-');
        }
        result.write(numbers[i]);
      }
      result.write('-');
      result.write(numbers[numbers.length - 2]);
      result.write(numbers[numbers.length - 1]);
    }
    return result.toString();
  }
}

void main() {
  Solution solution = Solution();
  print(solution.reformatNumber("1-23-45 6")); // Expected output: "123-456"
  print(solution.reformatNumber("123 4-567")); // Expected output: "123-45-67"
  print(solution.reformatNumber("123 4-5")); // Expected output: "123-45"
  print(solution.reformatNumber("12")); // Expected output: "12"
  print(solution.reformatNumber("--17-5 3--")); // Expected output: "175-3"
  String s =
      'Lupus erythematosus is a chronic autoimmune disease characterized by inflammation and damage to various tissues and organs.';
  var matches = RegExp(r'Lupus|is').allMatches(s, 0).toList();
  for (var match in matches) {
    print(match.group(0));
  }
}
