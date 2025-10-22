class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  int deepestLeavesSum(TreeNode? root) {
    if (root == null) return 0;
    List<TreeNode> queue = [root];
    List<TreeNode> nextQueue = [];
    List<int> listValue = [];
    while (queue.isNotEmpty) {
      TreeNode node = queue.removeAt(0);
      listValue.add(node.val);
      if (node.left != null) nextQueue.add(node.left!);
      if (node.right != null) nextQueue.add(node.right!);
      if (queue.isEmpty && nextQueue.isNotEmpty) {
        queue.addAll(nextQueue);
        nextQueue.clear();
        listValue.clear();
      }
    }
    int result = 0;
    for (var val in listValue) result += val;
    return result;
  }
}
