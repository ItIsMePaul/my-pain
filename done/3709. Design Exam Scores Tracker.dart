class ExamTracker {
  int minTime = 0;
  int maxTime = 0;
  Map<int, int> scoreMap = {};
  ExamTracker() {}

  void record(int time, int score) {
    scoreMap[time] = score;
    if (minTime == 0 || time < minTime) minTime = time;
    if (maxTime == 0 || time > maxTime) maxTime = time;
  }

  int totalScore(int startTime, int endTime) {
    int total = 0;
    List<int> times = scoreMap.keys
        .where((t) => t >= startTime && t <= endTime)
        .toList();
    for (var time in times) {
      if (scoreMap.containsKey(time)) total += scoreMap[time] ?? 0;
    }
    return total;
  }
}

/**
 * Your ExamTracker object will be instantiated and called as such:
 * ExamTracker obj = ExamTracker();
 * obj.record(time,score);
 * int param2 = obj.totalScore(startTime,endTime);
 */
