import 'dart:math';

class Solution {
  bool checkPrimeFrequency(List<int> nums) {
    Map<int, int> frequencyMap = {};
    for (var num in nums) {
      frequencyMap[num] = (frequencyMap[num] ?? 0) + 1;
    }
    for (var frequency in frequencyMap.values) {
      if (_isPrime(frequency)) {
        return true;
      }
    }
    return false;
  }

  bool _isPrime(int n) {
    if (n <= 1) return false;
    if (n == 2 || n == 3) return true;
    if (n % 2 == 0 || n % 3 == 0) return false;
    for (int i = 5; i <= sqrt(n); i = i + 6) if (n % i == 0 || n % (i + 2) == 0) return false;
    return true;
  }
}
