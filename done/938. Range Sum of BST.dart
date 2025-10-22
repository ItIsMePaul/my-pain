class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  int rangeSumBST(TreeNode? root, int low, int high) {
    if (root == null) return 0;
    int sum = 0;
    if (root.val >= low && root.val <= high) sum += root.val;
    if (root.val > low) sum += rangeSumBST(root.left, low, high);
    if (root.val < high) sum += rangeSumBST(root.right, low, high);
    return sum;
  }
}
