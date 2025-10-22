class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<double> averageOfLevels(TreeNode? root) {
    List<double> result = [];
    List<TreeNode> nodes = [root!];
    while (nodes.isNotEmpty) {
      List<TreeNode> temp = [];
      int sum = 0;
      for (var node in nodes) {
        sum += node.val;
        if (node.left != null) temp.add(node.left!);
        if (node.right != null) temp.add(node.right!);
      }
      result.add(sum / nodes.length);
      nodes = temp;
    }
    return result;
  }
}
