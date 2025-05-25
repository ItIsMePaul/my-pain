class UndergroundSystem {
  Map<int, List> checkInMap = {};
  Map<String, List<int>> checkOutMap = {};
  UndergroundSystem() {}

  void checkIn(int id, String stationName, int t) {
    checkInMap[id] = [stationName, t];
  }

  void checkOut(int id, String stationName, int t) {
    String key = '${checkInMap[id]![0] + ' - ' + stationName}';

    if (checkOutMap.containsKey(key)) {
      checkOutMap[key]!.add(t - (checkInMap[id]![1] as int));
    } else {
      checkOutMap[key] = [t - (checkInMap[id]![1] as int)];
    }

    checkInMap.remove(id);
  }

  double getAverageTime(String startStation, String endStation) {
    List<int> time = checkOutMap['${startStation + ' - ' + endStation}']!;
    double ans = 0;
    for (var t in time) ans += t;
    return ans / time.length;
  }
}

/**
 * Your UndergroundSystem object will be instantiated and called as such:
 * UndergroundSystem obj = UndergroundSystem();
 * obj.checkIn(id,stationName,t);
 * obj.checkOut(id,stationName,t);
 * double param3 = obj.getAverageTime(startStation,endStation);
 */