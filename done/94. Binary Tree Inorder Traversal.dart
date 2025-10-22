class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<int> inorderTraversal(TreeNode? root) {
    if (root == null) return [];
    List<int> numbers = [];
    numbers.addAll(inorderTraversal(root.left));
    numbers.add(root.val);
    numbers.addAll(inorderTraversal(root.right));
    return numbers;
  }
}
