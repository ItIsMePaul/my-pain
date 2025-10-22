class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  bool isSameTree(TreeNode? p, TreeNode? q) {
    List<dynamic> listP = _traversal(p);
    List<dynamic> listQ = _traversal(q);
    if (listQ.length != listP.length) return false;
    for (var i = 0; i < listP.length; i++) {
      if (listQ[i] != listP[i]) return false;
    }
    return true;
  }

  List<dynamic> _traversal(TreeNode? root) {
    if (root == null) return [null];
    List<dynamic> numbers = [];
    numbers.addAll(_traversal(root.right));
    numbers.addAll(_traversal(root.left));
    numbers.add(root.val);
    return numbers;
  }
}