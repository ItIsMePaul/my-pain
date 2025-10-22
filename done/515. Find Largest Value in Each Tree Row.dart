class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<int> largestValues(TreeNode? root) {
    if (root == null) return [];
    List<int> result = [];
    List<TreeNode> queue = [root];
    List<TreeNode> nextQueue = [];
    int max = -2147483648;
    while (queue.isNotEmpty) {
      TreeNode currentTreeNode = queue.removeLast();
      if (max < currentTreeNode.val) {
        max = currentTreeNode.val;
      }
      if (currentTreeNode.left != null) {
        nextQueue.add(currentTreeNode.left!);
      }
      if (currentTreeNode.right != null) {
        nextQueue.add(currentTreeNode.right!);
      }
      if (queue.isEmpty) {
        queue.addAll(nextQueue);
        nextQueue.clear();
        result.add(max);
        max = -2147483648;
      }
    }
    return result;
  }
}
