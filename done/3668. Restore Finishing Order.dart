class Solution {
  List<int> recoverOrder(List<int> order, List<int> friends) {
    Set<int> friendSet = friends.toSet();
    Set<int> orderSet = order.toSet();
    return orderSet.intersection(friendSet).toList();
  }
}
