class Solution {
  int subtractProductAndSum(int n) {
    List<String> splitedn = n.toString().split('');
    int product = 1, sum = 0;
    for (var e in splitedn) {
      product *= int.parse(e);
      sum += int.parse(e);
    }
    return product - sum;
  }
}
