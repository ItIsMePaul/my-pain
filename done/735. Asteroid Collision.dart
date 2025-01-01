class Solution {
  List<int> asteroidCollision(List<int> asteroids) {
    int abs(int i) => i > 0 ? i : -i;
    for (var i = 0; i < asteroids.length - 1; i++) {
      if ((asteroids[i].isNegative && !asteroids[i + 1].isNegative) ||
          (!asteroids[i].isNegative && asteroids[i + 1].isNegative)) {
        if (abs(asteroids[i]) == abs(asteroids[i + 1])) {
          asteroids.removeAt(i + 1);
          asteroids.removeAt(i);
          i = -1;
          continue;
        }
        if (abs(asteroids[i]) < abs(asteroids[i + 1])) {
          asteroids.removeAt(i);
          i = -1;
          continue;
        }
        if (abs(asteroids[i]) > abs(asteroids[i + 1])) {
          asteroids.removeAt(i + 1);
          i = -1;
          continue;
        }
      }
    }
    return asteroids;
  }
}
