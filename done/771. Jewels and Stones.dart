class Solution {
  int numJewelsInStones(String jewels, String stones) {
    int ans = 0;
    for (var i = 0; i < stones.length; i++)
      if (jewels.contains(stones[i])) ans++;
    return ans;
  }
}
