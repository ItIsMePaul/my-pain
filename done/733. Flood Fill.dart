class Solution {
  List<List<int>> floodFill(List<List<int>> image, int sr, int sc, int color) {
    if (image[sr][sc] == color) return image;
    int bc = image[sr][sc];
    image[sr][sc] = color;
    List<List<int>> check = [
      [sr, sc],
    ];
    while (check.isNotEmpty) {
      List<int> p = check.removeLast();
      if (p[0] - 1 >= 0 && image[p[0] - 1][p[1]] == bc) {
        check.add([p[0] - 1, p[1]]);
        image[p[0] - 1][p[1]] = color;
      }
      if (p[0] + 1 < image.length && image[p[0] + 1][p[1]] == bc) {
        check.add([p[0] + 1, p[1]]);
        image[p[0] + 1][p[1]] = color;
      }
      if (p[1] - 1 >= 0 && image[p[0]][p[1] - 1] == bc) {
        check.add([p[0], p[1] - 1]);
        image[p[0]][p[1] - 1] = color;
      }
      if (p[1] + 1 < image[p[0]].length && image[p[0]][p[1] + 1] == bc) {
        check.add([p[0], p[1] + 1]);
        image[p[0]][p[1] + 1] = color;
      }
    }
    return image;
  }
}
