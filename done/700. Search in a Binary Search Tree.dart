class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  TreeNode? searchBST(TreeNode? root, int val) {
    if (root == null) return null;
    if (root.val == val) return root;
    if (root.val > val)
      return searchBST(root.left, val);
    else
      return searchBST(root.right, val);
  }
}
