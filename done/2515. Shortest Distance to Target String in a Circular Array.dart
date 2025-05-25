class Solution {
  int closetTarget(List<String> words, String target, int startIndex) {
    if (!words.contains(target)) return -1;
    int distance = 0;
    while (words[(startIndex + distance) % words.length] != target &&
        words[(startIndex - distance) % words.length] != target) {
      distance++;
    }
    return distance;
  }
}
