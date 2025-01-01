class Solution {
  String destCity(List<List<String>> paths) {
    String nextStop = paths[0][1];
    paths.removeAt(0);
    for (var i = 0; i < paths.length; i++) {
      if (paths[i][0] == nextStop) {
        nextStop = paths[i][1];
        paths.removeAt(i);
        i = -1;
      }
    }
    return nextStop;
  }
}
