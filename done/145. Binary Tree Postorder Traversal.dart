class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<int> postorderTraversal(TreeNode? root) {
    if (root == null) return [];
    List<int> numbers = [];
    numbers.addAll(postorderTraversal(root.right));
    numbers.addAll(postorderTraversal(root.left));
    numbers.add(root.val);
    return numbers;
  }
}
