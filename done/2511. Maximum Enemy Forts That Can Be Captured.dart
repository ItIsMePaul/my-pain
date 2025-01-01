class Solution {
  int captureForts(List<int> forts) {
    int countZeros(List<int> arr) {
      int ans = 0;
      for (var i = 0; i < arr.length; i++) {
        if (arr[i] == 0) {
          ans++;
          continue;
        }
        if ((arr[i] == -1 || arr[i] == 1) && i != 0 && i != arr.length - 1) {
          return -1;
        }
      }
      return ans;
    }

    int ans = 0;
    int firstPosition = -1;
    int secondPosition = -1;
    for (var i = 0; i < forts.length; i++) {
      if (forts[i] == 1) firstPosition = i;
      if (forts[i] == -1) secondPosition = i;
      if (secondPosition != -1 && firstPosition != -1) {
        int temp = countZeros(forts.sublist(
          firstPosition < secondPosition ? firstPosition : secondPosition,
          firstPosition > secondPosition
              ? firstPosition + 1
              : secondPosition + 1,
        ));
        if (temp == -1) continue;
        ans = ans > temp ? ans : temp;
      }
    }
    return ans;
  }
}
