class Solution {
  int maximumHappinessSum(List<int> happiness, int k) {
    happiness.sort();
    int sum = 0;
    int removedKids = 0;
    while (k - removedKids > 0) {
      int temp = happiness.removeLast() - removedKids++;
      if(temp < 1) break;
      sum += temp;
    }
    return sum;
  }
}