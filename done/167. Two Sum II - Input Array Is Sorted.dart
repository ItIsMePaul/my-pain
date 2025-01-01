class Solution {
  List<int> twoSum(List<int> numbers, int target) {
    int firstPoint = 0;
    int secondPoint = numbers.length - 1;
    while (numbers[firstPoint] + numbers[secondPoint] != target) {
      int temp = numbers[firstPoint] + numbers[secondPoint];
      if (temp > target) {
        secondPoint--;
      } else {
        firstPoint++;
      }
    }
    return [firstPoint + 1, secondPoint + 1];
  }
}
