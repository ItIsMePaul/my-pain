class Solution {
  int dividePlayers(List<int> skill) {
    skill.sort();
    int result = 0;
    int power = skill.first + skill.last;
    for (var i = 0; i < skill.length ~/ 2; i++) {
      if (power == skill[i] + skill[skill.length - 1 - i]) {
        result += skill[i] * skill[skill.length - 1 - i];
      } else {
        return -1;
      }
    }
    return result;
  }
}
