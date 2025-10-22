class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  void reorderList(ListNode? head) {
    if (head == null) return;
    List<int> temp = [];
    ListNode? current = head;
    while (current != null) {
      temp.add(current.val);
      current = current.next;
    }
    List<int> list = [];
    while (temp.isNotEmpty) {
      list.add(temp.removeAt(0));
      if (temp.isNotEmpty) {
        list.add(temp.removeLast());
      }
    }

    current = head;
    while (list.isNotEmpty) {
      current!.val = list.removeAt(0);
      current = current.next;
    }
  }
}
