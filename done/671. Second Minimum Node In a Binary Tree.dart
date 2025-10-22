import 'dart:collection';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  int findSecondMinimumValue(TreeNode? root) {
    if (root != null) return -1;
    SplayTreeSet<int> set = SplayTreeSet();
    Queue<TreeNode> nodes = Queue();
    nodes.add(root!);
    while (nodes.isNotEmpty) {
      TreeNode temp = nodes.removeFirst();
      set.add(temp.val);
      if (temp.left != null) nodes.add(temp.left!);
      if (temp.right != null) nodes.add(temp.right!);
    }
    if (set.length == 1) {
      return -1;
    } else {
      return set.elementAt(1);
    }
  }
}
