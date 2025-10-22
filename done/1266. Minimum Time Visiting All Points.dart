class Solution {
  int minTimeToVisitAllPoints(List<List<int>> points) {
    int result = 0;
    List<int> currentPoint = points[0];
    for (var i = 1; i < points.length; i++) {
      while (currentPoint[0] != points[i][0] ||
          currentPoint[1] != points[i][1]) {
        bool verticalDirection = currentPoint[1] > points[i][1];
        bool horizontalDirection = currentPoint[0] > points[i][0];
        if (currentPoint[0] == points[i][0]) {
          if (verticalDirection)
            currentPoint[1]--;
          else
            currentPoint[1]++;
          result++;
          continue;
        }
        if (currentPoint[1] == points[i][1]) {
          if (horizontalDirection)
            currentPoint[0]--;
          else
            currentPoint[0]++;
          result++;
          continue;
        }
        if (!horizontalDirection && verticalDirection) {
          result++;
          currentPoint[0]++;
          currentPoint[1]--;
          continue;
        }
        if (horizontalDirection && !verticalDirection) {
          result++;
          currentPoint[0]--;
          currentPoint[1]++;
          continue;
        }
        if (!horizontalDirection && !verticalDirection) {
          result++;
          currentPoint[0]++;
          currentPoint[1]++;
          continue;
        }
        if (horizontalDirection && verticalDirection) {
          result++;
          currentPoint[0]--;
          currentPoint[1]--;
          continue;
        }
      }
    }
    return result;
  }
}

void main() {
  Solution s = Solution();
  print(
    s.minTimeToVisitAllPoints([
      [1, 1],
      [3, 4],
      [-1, 0],
    ]),
  );
}
