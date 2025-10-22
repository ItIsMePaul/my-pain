class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? sortList(ListNode? head) {
    List<int> list = [];
    while (head != null) {
      list.add(head.val);
      head = head.next;
    }
    list.sort();
    print(list);
    ListNode? current = ListNode(list.removeAt(0));
    head = current;
    for (var val in list) {
      current.val = val;
      current.next = current;
    }
    return head;
  }
}
