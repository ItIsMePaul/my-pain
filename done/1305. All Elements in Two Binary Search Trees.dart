import 'dart:collection';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<int> getAllElements(TreeNode? root1, TreeNode? root2) {
    if (root1 == null && root2 == null) return [];
    Queue<TreeNode> queue = Queue();
    if (root1 != null) queue.add(root1);
    if (root2 != null) queue.add(root2);
    List<int> result = [];
    while (queue.isNotEmpty) {
      TreeNode node = queue.removeFirst();
      result.add(node.val);
      if (node.left != null) queue.add(node.left!);
      if (node.right != null) queue.add(node.right!);
    }
    return result;
  }
}