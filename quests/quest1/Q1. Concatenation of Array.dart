class Solution {
  List<int> getConcatenation(List<int> nums) => [...nums, ...nums];
}

void main() {
  print(Solution().getConcatenation([1, 3, 5, 2]));
}
