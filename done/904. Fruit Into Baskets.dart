class Solution {
  int totalFruit(List<int> fruits) {
    Map<int, int> count = {};
    int left = 0;
    int max = 0;
    for (var right = 0; right < fruits.length; right++) {
      count[fruits[right]] = (count[fruits[right]] ?? 0) + 1;
      while (count.length > 2) {
        count[fruits[left]] = count[fruits[left]]! - 1;
        if (count[fruits[left]] == 0) {
          count.remove(fruits[left]);
        }
        left++;
      }
      max = max > (right - left + 1) ? max : (right - left + 1);
    }
    return max;
  }
}
