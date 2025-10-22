class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  bool leafSimilar(TreeNode? root1, TreeNode? root2) {
    List<int> leaves1 = [];
    List<int> leaves2 = [];
    List<TreeNode> stack = [root1!];
    while (stack.isNotEmpty) {
      TreeNode node = stack.removeLast();
      if (node.left == null && node.right == null) leaves1.add(node.val);
      if (node.right != null) stack.add(node.right!);
      if (node.left != null) stack.add(node.left!);
    }
    stack.add(root2!);
    while (stack.isNotEmpty) {
      TreeNode node = stack.removeLast();
      if (node.left == null && node.right == null) leaves2.add(node.val);
      if (node.right != null) stack.add(node.right!);
      if (node.left != null) stack.add(node.left!);
    }
    return leaves1.join(' ') == leaves2.join(' ');
  }
}
