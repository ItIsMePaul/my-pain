class Solution {
  int largestAltitude(List<int> gain) {
    int altitude = 0;
    int maxAltitude = 0;
    for (var g in gain) {
      altitude += g;
      if (altitude > maxAltitude) maxAltitude = altitude;
    }
    return maxAltitude;
  }
}
