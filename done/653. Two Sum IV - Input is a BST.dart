class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  bool findTarget(TreeNode? root, int k) {
    if (root == null) return false;
    Set<int> elements = {};
    List<TreeNode> queue = [root];
    while (queue.isNotEmpty) {
      TreeNode node = queue.removeAt(0);
      if (elements.contains(k - node.val)) return true;
      elements.add(node.val);
      if (node.left != null) queue.add(node.left!);
      if (node.right != null) queue.add(node.right!);
    }
    return false;
  }
}
