import 'dart:collection';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<List<int>> levelOrder(TreeNode? root) {
    List<List<int>> ans = [];
    if (root == null) return [];
    Queue<TreeNode> queue = Queue<TreeNode>();
    queue.add(root);
    while (queue.isNotEmpty) {
      int levelLength = queue.length;
      List<int> currentLevel = [];
      for (var i = 0; i < levelLength; i++) {
        TreeNode node = queue.removeFirst();
        currentLevel.add(node.val);
        if (node.left != null) queue.add(node.left!);
        if (node.right != null) queue.add(node.right!);
      }
      ans.add(currentLevel);
    }
    return ans;
  }
}
