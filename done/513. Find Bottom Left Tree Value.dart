class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  int findBottomLeftValue(TreeNode? root) {
    if (root == null) return -1;
    List<TreeNode> queue = [root];
    List<TreeNode> nextQueue = [];
    List<int> values = [];
    while (queue.isNotEmpty) {
      TreeNode node = queue.removeAt(0);
      if (node.left != null) nextQueue.add(node.left!);
      if (node.right != null) nextQueue.add(node.right!);
      values.add(node.val);
      if (queue.isEmpty) {
        if (nextQueue.isEmpty) return values.first;
        queue = nextQueue;
        values = [];
        nextQueue = [];
      }
    }
    return -1;
  }
}

void main() {
  TreeNode? tree = TreeNode(2);
  tree.left = TreeNode(1);
  tree.right = TreeNode(3);

  ///     2
  ///    / \
  ///   1   3
  print(Solution().findBottomLeftValue(tree));
}
