class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<int> preorderTraversal(TreeNode? root) {
    if (root == null) return [];
    List<int> numbers = [];
    numbers.add(root.val);
    numbers.addAll(preorderTraversal(root.left));
    numbers.addAll(preorderTraversal(root.right));
    return numbers;
  }
}
