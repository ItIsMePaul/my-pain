class Solution {
  List<bool> kidsWithCandies(List<int> candies, int extraCandies) {
    bool isGreatest(List<int> candies, int index) {
      for (var i = 0; i < candies.length; i++) {
        if (index != i && candies[index] + extraCandies < candies[i]) {
          return false;
        }
      }
      return true;
    }

    List<bool> ans = [];
    for (var i = 0; i < candies.length; i++) {
      ans.add(isGreatest(candies, i));
    }
    return ans;
  }
}
