class Solution {
  int splitNum(int num) {
    String s = num.toString().replaceAll('0', '');
    List<int> nums = [];
    for (var char in s.split('')) {
      nums.add(int.parse(char));
    }
    nums.sort();
    StringBuffer num1 = StringBuffer();
    StringBuffer num2 = StringBuffer();
    bool sWitch = true;
    for (var num in nums) {
      if (sWitch) {
        num1.write(num);
        sWitch = !sWitch;
      } else {
        num2.write(num);
        sWitch = !sWitch;
      }
    }
    return (int.tryParse(num1.toString()) ?? 0) +
        (int.tryParse(num2.toString()) ?? 0);
  }
}
