class Solution {
  List<int> corpFlightBookings(List<List<int>> bookings, int n) {
    List<int> result = List.filled(n, 0);
    for (var book in bookings) {
      for (var i = book[0] - 1; i < book[1]; i++) {
        result[i] += book[2];
      }
    }
    return result;
  }
}
