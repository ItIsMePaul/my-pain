import 'dart:collection';

class SeatManager {
  SplayTreeSet<int> aSeats = SplayTreeSet();
  SplayTreeSet<int> rSeats = SplayTreeSet();
  SeatManager(int n) {
    aSeats.addAll(List.generate(n, (int index) => index + 1));
  }

  int reserve() {
    int seat = aSeats.first;
    aSeats.remove(seat);
    rSeats.add(seat);
    return seat;
  }

  void unreserve(int seatNumber) {
    rSeats.remove(seatNumber);
    aSeats.add(seatNumber);
  }
}
