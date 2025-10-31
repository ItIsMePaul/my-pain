class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class BSTIterator {
  List<int> values = [];
  int pointer = 0;
  BSTIterator(TreeNode? root) {
    List<TreeNode> stack = [];
    TreeNode? curr = root;
    while (curr != null || stack.isNotEmpty) {
      if (curr != null) {
        stack.add(curr);
        curr = curr.left;
      } else {
        curr = stack.removeLast();
        values.add(curr.val);
        curr = curr.right;
      }
    }
  }

  int next() => values[pointer++];

  bool hasNext() => pointer < values.length;
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * BSTIterator obj = BSTIterator(root);
 * int param1 = obj.next();
 * bool param2 = obj.hasNext();
 */
