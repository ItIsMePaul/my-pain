class Solution {
  int countLargestGroup(int n) {
    int sumDigits(int num) {
      List<String> digits = num.toString().split('');
      int ans = 0;
      for (var e in digits) {
        ans += int.parse(e);
      }
      return ans;
    }

    Map<int, List<int>> data = {};
    for (var i = 1; i <= n; i++) {
      int temp = sumDigits(i);
      if (data.containsKey(temp)) {
        data[temp]!.add(i);
      } else {
        data[temp] = [i];
      }
    }
    print(data);
    int ans = 0;
    int temp = data[1]!.length;
    for (var i in data.keys) {
      if (temp <= data[i]!.length) {
        if (temp == data[i]!.length) {
          ans++;
        } else {
          temp = data[i]!.length;
          ans = 1;
        }
      }
    }
    return ans;
  }
}
