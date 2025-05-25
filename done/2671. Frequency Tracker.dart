class FrequencyTracker {
  Map<int, int> numberCount = {};
  Map<int, int> frequentCount = {};
  FrequencyTracker() {}

  void add(int number) {
    int currentFrequent = (numberCount[number] ?? 0);

    frequentCount[currentFrequent] = (frequentCount[currentFrequent] ?? 0) - 1;
    frequentCount[currentFrequent + 1] =
        (frequentCount[currentFrequent + 1] ?? 0) + 1;

    numberCount[number] = currentFrequent + 1;
  }

  void deleteOne(int number) {
    if (!numberCount.containsKey(number) || numberCount[number] == 0) return;

    int currentFrequent = (numberCount[number] ?? 0);

    frequentCount[currentFrequent] = (frequentCount[currentFrequent] ?? 0) - 1;
    frequentCount[currentFrequent - 1] =
        (frequentCount[currentFrequent - 1] ?? 0) + 1;

    numberCount[number] = currentFrequent - 1;
  }

  bool hasFrequency(int frequency) {
    return (frequentCount[frequency] ?? 0) > 0;
  }
}

/**
 * Your FrequencyTracker object will be instantiated and called as such:
 * FrequencyTracker obj = FrequencyTracker();
 * obj.add(number);
 * obj.deleteOne(number);
 * bool param3 = obj.hasFrequency(frequency);
 */