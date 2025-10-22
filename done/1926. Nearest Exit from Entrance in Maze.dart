class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  int minDepth(TreeNode? root) {
    List<TreeNode?> queue = [];
    if (root == null) return 0;
    queue.add(root);
    int depth = 0;
    while (queue.isNotEmpty) {
      depth++;
      int size = queue.length;
      for (int i = 0; i < size; i++) {
        TreeNode? node = queue.removeAt(0);
        if (node!.left == null && node.right == null) return depth;
        if (node.left != null) queue.add(node.left);
        if (node.right != null) queue.add(node.right);
      }
    }
    return depth;
  }
}
