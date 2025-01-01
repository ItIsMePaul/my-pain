class Solution {
  int minimumRecolors(String blocks, int k) {
    int countWhite(String block) {
      int ans = 0;
      for (var i = 0; i < block.length; i++) {
        if (block[i] == 'W') ans++;
      }
      return ans;
    }

    int ans = 101;
    for (var i = 0; i <= blocks.length - k; i++) {
      int temp = countWhite(blocks.substring(i, i + k));
      if (temp < ans) ans = temp;
    }
    return ans;
  }
}
