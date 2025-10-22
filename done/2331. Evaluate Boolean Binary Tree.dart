class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  bool evaluateTree(TreeNode? root) {
    List<List<int>> storage = [];
    List<TreeNode> queue = [root!];

    List<TreeNode> nextQueue = [];
    List<int> temp = [];
    while (queue.isNotEmpty) {
      TreeNode node = queue.removeAt(0);
      temp.add(node.val);
      if (node.right != null) nextQueue.add(node.right!);
      if (node.left != null) nextQueue.add(node.left!);
      if (queue.isEmpty) {
        storage.add(List.from(temp));
        queue.addAll(nextQueue);
        nextQueue.clear();
        temp.clear();
      }
    }
    while (storage.length != 1) {
      late bool firstElement;
      late bool secondElement;
      if (storage.last[0] == 0 || storage.last[0] == 1) {
        firstElement = storage.last[0] == 0 ? false : true;
        storage.last.removeAt(0);
      }
      if (storage.last[0] == 0 || storage.last[0] == 1) {
        secondElement = storage.last[0] == 0 ? false : true;
        storage.last.removeAt(0);
      }

      late int operationType;
      late int position;
      for (var i = 0; i < storage[storage.length - 2].length; i++) {
        int temp = storage[storage.length - 2][i];
        if (temp == 2 || temp == 3) {
          operationType = temp;
          position = i;
          break;
        }
      }
      storage[storage.length - 2].removeAt(position);
      late bool result;
      if (operationType == 2)
        result = firstElement || secondElement;
      else
        result = firstElement && secondElement;
      storage[storage.length - 2].insert(position, result ? 1 : 0);
      if (storage.last.isEmpty) storage.removeLast();
    }
    return storage[0][0] == 0 ? false : true;
  }
}

void main() {
  // [2,1,3,null,null,0,1]
  TreeNode? root = TreeNode(2);
  root.left = TreeNode(1);
  root.right = TreeNode(3);
  root.right!.left = TreeNode(0);
  root.right!.right = TreeNode(1);
  Solution solution = Solution();
  print(solution.evaluateTree(root));
}
