class Solution {
  bool isPathCrossing(String path) {
    Set<String> seen = {};
    List<int> origin = [0, 0];
    seen.add(origin.join('|'));
    for (var i = 0; i < path.length; i++) {
      switch (path[i]) {
        case 'N':
          origin[0]++;
          break;
        case 'S':
          origin[0]--;
          break;
        case 'E':
          origin[1]++;
          break;
        case 'W':
          origin[1]--;
          break;
      }
      String temp = origin.join('|');
      if (seen.contains(temp)) {
        return true;
      } else {
        seen.add(temp);
      }
    }
    return false;
  }
}

void main() {
  print(Solution().isPathCrossing("NEEEEEEEEEENNNNNNNNNNWWWWWWWWWW"));
}
