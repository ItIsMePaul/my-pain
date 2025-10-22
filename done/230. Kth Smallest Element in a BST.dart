class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  int kthSmallest(TreeNode? root, int k) {
    List<int> result = [];
    result = _inOrder(root, []);
    return result[k - 1];
  }

  List<int> _inOrder(TreeNode? node, List<int> result) {
    if (node == null) return result;
    _inOrder(node.left, result);
    result.add(node.val);
    _inOrder(node.right, result);
    return result;
  }
}

void main() {
  TreeNode? tree = TreeNode(3);
  tree.left = TreeNode(1);
  tree.right = TreeNode(4);
  tree.left!.right = TreeNode(2);

  ///     3
  ///    / \
  ///   1   4
  ///    \
  ///     2
  ///
  ///
  print(Solution().kthSmallest(tree, 1));
}
