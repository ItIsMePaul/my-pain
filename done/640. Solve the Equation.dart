class Solution {
  String? solveEquation(String equation) {
    int _strToInt(String s) {
      if (s.endsWith('x')) {
        s = s.substring(0, s.length - 1);
        if (s.isEmpty || (s.length <= 1 && s[0] == '-')) {
          s = s + '1';
        }
      }

      return int.parse(s);
    }

    List<List<String>> elementsSet = [];
    int row = 0;
    for (var part in equation.split('=')) {
      elementsSet.add([]);
      for (var element in part.split(RegExp(r'[+]|(?=[-])'))) {
        elementsSet[row].add(element);
      }
      row++;
    }
    int leftPart = 0;
    int rightPart = 0;
    bool flag = true;
    for (var elements in elementsSet) {
      for (var i = 0; i < elements.length; i++) {
        String temp = elements[i];
        if (temp.endsWith('x')) {
          if (!flag) {
            if (temp[0] == '-') {
              temp = temp.substring(1);
            } else {
              temp = '-' + temp;
            }
          }
          leftPart += _strToInt(temp);
        } else {
          if (flag) {
            if (temp[0] == '-') {
              temp = temp.substring(1);
            } else {
              temp = '-' + temp;
            }
          }
          rightPart += _strToInt(temp);
        }
      }
      flag = !flag;
    }

    print(elementsSet);
    print(leftPart);
    print(rightPart);
    if (leftPart == 0) {
      return "No solution";
    }
    if (rightPart == 0) {
      return "Infinite solutions";
    }
    return 'x=${rightPart ~/ leftPart}';
  }
}

void main() {
  print(Solution().solveEquation("x+5-3+x=6+x-2"));
}
