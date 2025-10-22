class Solution {
  double angleClock(int hour, int minutes) {
    double hourAngle = hour % 12 * 30 + minutes * 0.5;
    double minuteAngle = minutes * 6;
    double angleDifference = (hourAngle - minuteAngle).abs();
    if ((360.0 - angleDifference) > angleDifference) {
      return angleDifference;
    } else {
      return 360.0 - angleDifference;
    }
  }
}
