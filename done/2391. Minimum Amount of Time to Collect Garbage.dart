class Solution {
  int garbageCollection(List<String> garbage, List<int> travel) {
    List<int> metal = List.filled(garbage.length, 0, growable: true);
    List<int> glass = List.filled(garbage.length, 0, growable: true);
    List<int> paper = List.filled(garbage.length, 0, growable: true);
    int result = 0;
    for (var i = 0; i < garbage.length; i++) {
      for (var pile in garbage[i].split('')) {
        switch (pile) {
          case 'M':
            metal[i]++;
            break;
          case 'G':
            glass[i]++;
            break;
          case 'P':
            paper[i]++;
            break;          
        }
      }
    }
    for (var i = garbage.length - 1; i >= 0; i--) if (metal[i] == 0) metal.removeLast(); else break;
    for (var i = garbage.length - 1; i >= 0; i--) if (glass[i] == 0) glass.removeLast(); else break;
    for (var i = garbage.length - 1; i >= 0; i--) if (paper[i] == 0) paper.removeLast(); else break;
    for (var group in [metal, glass, paper]) {
      for (var i = 0; i < group.length; i++) {
        result += group[i];
        if (i != group.length - 1) result += travel[i];
      }
    }
    return result;
  }
}