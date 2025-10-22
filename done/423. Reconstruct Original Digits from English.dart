class Solution {
  String originalDigits(String s) {
    Map<String, int> map = {};

    void _reduceOrRemoveFromMap(int min, List<String> letters) {
      for (var letter in letters) {
        map[letter] = map[letter]! - min;
        if (map[letter]! <= 0) map.remove(letter);
      }
    }

    List<String> result = [];
    for (var letter in s.split('')) map[letter] = (map[letter] ?? 0) + 1;
    if (map.containsKey('z')) {
      result.add('0' * map['z']!);
      _reduceOrRemoveFromMap(map['z']!, ['z', 'e', 'r', 'o']);
    }
    if (map.containsKey('w')) {
      int min = map['w']!;
      result.add('2' * min);
      _reduceOrRemoveFromMap(min, ['t', 'w', 'o']);
    }
    if (map.containsKey('x')) {
      int min = map['x']!;
      result.add('6' * min);
      _reduceOrRemoveFromMap(min, ['s', 'i', 'x']);
    }
    if (map.containsKey('g')) {
      int min = map['g']!;
      result.add('8' * min);
      _reduceOrRemoveFromMap(min, ['e', 'i', 'g', 'h', 't']);
    }
    if (map.containsKey('u')) {
      int min = map['u']!;
      result.add('4' * min);
      _reduceOrRemoveFromMap(min, ['f', 'o', 'u', 'r']);
    }
    if (map.containsKey('o')) {
      int min = map['o']!;
      result.add('1' * min);
      _reduceOrRemoveFromMap(min, ['o', 'n', 'e']);
    }
    if (map.containsKey('f')) {
      int min = map['f']!;
      result.add('5' * min);
      _reduceOrRemoveFromMap(min, ['f', 'i', 'v', 'e']);
    }
    if (map.containsKey('h')) {
      int min = map['h']!;
      result.add('3' * min);
      _reduceOrRemoveFromMap(min, ['t', 'h', 'r', 'e', 'e']);
    }
    if (map.containsKey('s')) {
      int min = map['s']!;
      result.add('7' * min);
      _reduceOrRemoveFromMap(min, ['s', 'e', 'v', 'e', 'n']);
    }
    if (map.containsKey('i')) {
      int min = map['i']!;
      result.add('9' * min);
      _reduceOrRemoveFromMap(min, ['n', 'i', 'n', 'e']);
    }
    result.sort();
    return result.join('');
  }
}
