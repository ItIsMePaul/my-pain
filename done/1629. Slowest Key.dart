class Solution {
  String slowestKey(List<int> releaseTimes, String keysPressed) {
    int releaseTime = releaseTimes[0];
    String key = keysPressed[0];
    for (var i = 1; i < releaseTimes.length; i++) {
      int temp = releaseTimes[i] - releaseTimes[i - 1];
      if (temp >= releaseTime) {
        if (temp > releaseTime) {
          releaseTime = releaseTimes[i] - releaseTimes[i - 1];
          key = keysPressed[i];
          continue;
        } else if (keysPressed[i].codeUnits[0] > key[0].codeUnits[0]) {
          key = keysPressed[i];
          continue;
        }
      }
    }
    return key;
  }
}
