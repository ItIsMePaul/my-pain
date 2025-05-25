class Solution {
  int minMovesToSeat(List<int> seats, List<int> students) {
    seats.sort();
    students.sort();
    int ans = 0;
    for (var i = 0; i < students.length; i++) {
      ans += (seats[i] - students[i]).abs();
    }
    return ans;
  }
}
