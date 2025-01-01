class Solution {
  int buttonWithLongestTime(List<List<int>> events) {
    List<int> pressedTime = [];
    int longestPressedTime = events[0][1];
    int ans = 100001;
    pressedTime.add(longestPressedTime);
    for (var i = 1; i < events.length; i++) {
      int temp = events[i][1] - events[i - 1][1];
      pressedTime.add(temp);
      if (longestPressedTime < temp) {
        longestPressedTime = temp;
      }
    }
    for (var i = 0; i < events.length; i++) {
      if (longestPressedTime == pressedTime[i] && ans > events[i][0]) {
        ans = events[i][0];
      }
    }
    return ans;
  }
}
