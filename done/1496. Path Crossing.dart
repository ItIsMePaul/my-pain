class Solution {
  bool isPathCrossing(String path) {
    List<String> listpath = path.split('');
    List<int> position = [0, 0];
    List<List<int>> historyPosition = [
      [0, 0],
    ];
    for (var i = 0; i < listpath.length; i++) {
      String p = listpath[i];
      print(p);
      switch (p) {
        case 'N':
          position[0] = position[0] + 1;
          print('N');
        case 'S':
          position[0] = position[0] - 1;
          print('S');
        case 'E':
          position[1] = position[1] + 1;
          print('E');
        case 'W':
          position[1] = position[1] - 1;
          print('W');
      }
      print(position);
      if (historyPosition.contains(position)) {
        return true;
      }
      int j = 0;
      historyPosition.add([]);
      for (var c in position) {
        historyPosition[i + 1].insert(j, c);
        j++;
      }
    }
    return false;
  }
}
