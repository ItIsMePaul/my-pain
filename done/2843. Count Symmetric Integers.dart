class Solution {
  int countSymmetricIntegers(int low, int high) {
    bool isSymmetric(String num) {
      int temp1 = 0;
      int temp2 = 0;
      for (var i = 0; i < num.length ~/ 2; i++) {
        temp1 += int.parse(num[i]);
        temp2 += int.parse(num[num.length ~/ 2 + i]);
      }
      return temp1 == temp2;
    }

    int ans = 0;
    for (var i = low; i <= high; i++) {
      if (i.toString().length % 2 == 0 && isSymmetric(i.toString())) ans++;
    }
    return ans;
  }
}
