class Solution {
  int calculateScore(List<String> instructions, List<int> values) {
    int score = 0;
    Set<int> visited = {};
    for (var i = 0; i < instructions.length;) {
      switch (instructions[i]) {
        case 'add':
          score += values[i];
          visited.add(i);
          i++;
          break;
        case 'jump':
          visited.add(i);
          i = i + values[i];
          break;
      }
      if (visited.contains(i) || i < 0 || i >= values.length) break;
    }
    return score;
  }
}
