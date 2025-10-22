class Solution {
  int countMatches(List<List<String>> items, String ruleKey, String ruleValue) {
    int c = 0;
    switch (ruleKey) {
      case 'type':
        for (var e in items) {
          if (e[0] == ruleValue) {
            c++;
          }
        }
        break;
      case 'color':
        for (var e in items) {
          if (e[1] == ruleValue) {
            c++;
          }
        }
        break;
      case 'name':
        for (var e in items) {
          if (e[2] == ruleValue) {
            c++;
          }
        }
        break;
    }
    return c;
  }
}
