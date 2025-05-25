class Solution {
  String fractionAddition(String expression) {
    int _GCD(int a, int b) {
      if (a == 0) return b;
      return _GCD(b % a, a);
    }

    int _LMC(int a, int b) {
      int smallest = a > b ? b : a;
      int greater = a > b ? a : b;
      for (var i = greater; ; i += greater) {
        if (i % smallest == 0) return i;
      }
    }

    Map<int, int> elements = {};
    for (var part in expression.split(RegExp(r'[+]|(?=[-])'))) {
      List<String> numeratorAndDenominator = part.split('/');
      int numerator = int.parse(numeratorAndDenominator[0]);
      int denominator = int.parse(numeratorAndDenominator[1]);
      if (elements.containsKey(denominator)) {
        elements[denominator] = elements[denominator]! + numerator;
        if (elements[denominator] == 0) elements.remove(denominator);
      } else {
        elements[denominator] = numerator;
      }
    }
    if (elements.isEmpty) return '0/1';

    int lmc = elements.keys.first;
    for (var i = 1; i < elements.keys.length; i++) {
      lmc = _LMC(lmc, elements.keys.elementAt(i));
    }
    int finalNumerator = 0;
    for (var key in elements.keys) {
      finalNumerator += elements[key]! * (lmc ~/ key);
    }
    int gcd = _GCD(lmc, finalNumerator);
    return '${finalNumerator ~/ gcd}/${lmc ~/ gcd}';
  }
}

void main() {
  print(Solution().fractionAddition("1/3-1/2"));
}
