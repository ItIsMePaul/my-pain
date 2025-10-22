class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  int maxLevelSum(TreeNode? root) {
    if (root == null) return 0;
    List<TreeNode> queue = [root];
    List<TreeNode> nextQueue = [];
    int maxSum = root.val;
    int tempSum = 0;
    int result = 1;
    int temp = 1;
    while (queue.isNotEmpty) {
      TreeNode node = queue.removeLast();
      tempSum += node.val;
      if (node.left != null) nextQueue.add(node.left!);
      if (node.right != null) nextQueue.add(node.right!);
      if (queue.isEmpty) {
        if (tempSum > maxSum) {
          maxSum = tempSum;
          result = temp;
        }
        queue.addAll(nextQueue);
        nextQueue.clear();
        tempSum = 0;
        temp += 1;
      }
    }
    return result;
  }
}

void main() {
  // [1,2,3]
  TreeNode root = TreeNode(1);
  root.left = TreeNode(2);
  root.right = TreeNode(3);
  print(Solution().maxLevelSum(root)); // Output: 2
}
