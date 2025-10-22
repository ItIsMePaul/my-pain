class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  int maxDepth(TreeNode? root) {
    int result = 0;
    if (root == null) return result;

    List<TreeNode> currentQueue = [root];
    List<TreeNode> nextQueue = [root];
    while (currentQueue.isNotEmpty) {
      if (currentQueue.last.left != null)
        nextQueue.add(currentQueue.last.left!);
      if (currentQueue.last.right != null)
        nextQueue.add(currentQueue.last.right!);
      currentQueue.removeLast();
      if (currentQueue.isEmpty) {
        currentQueue.addAll(nextQueue);
        nextQueue.clear();
        result++;
      }
    }
    return result - 1;
  }
}
