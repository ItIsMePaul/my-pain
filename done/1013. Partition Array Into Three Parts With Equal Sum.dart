class Solution {
  bool canThreePartsEqualSum(List<int> arr) {
    List<int> rightSum = [arr.last];
    List<int> leftSum = [arr.first];
    for (var i = 0; i < arr.length - 1; i++) {
      rightSum.insert(0, rightSum.first + arr[arr.length - 2 - i]);
      leftSum.add(leftSum.last + arr[i + 1]);
    }
    for (var i = 0; i < leftSum.length - 2; i++) {
      for (var j = rightSum.length - 1; j > i + 1; j--) {
        if (leftSum[i] == rightSum[j]) {
          int sum = arr
              .sublist(i + 1, j)
              .fold(0, (previousValue, element) => previousValue + element);
          if (sum == rightSum[j] && sum == leftSum[i]) {
            return true;
          }
        }
      }
    }
    return false;
  }
}

void main() {
  print(Solution().canThreePartsEqualSum([3, 3, 6, 5, -2, 2, 5, 1, -9, 4]));
}
