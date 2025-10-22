class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? insertionSortList(ListNode? head) {
    List<int> list = [];
    while (head != null) {
      list.add(head.val);
      head = head.next;
    }
    list.sort();
    head = ListNode(list[0]);
    ListNode? curr;
    curr = head;
    for (var i = 1; i < list.length; i++) {
      curr!.next = ListNode(list[i]);
      curr = curr.next;
    }
    return head;
  }
}

void main() {
  ListNode? nodes = ListNode(4, ListNode(2, ListNode(1, ListNode(3))));
  nodes = Solution().insertionSortList(nodes);
  while (nodes != null) {
    print(nodes.val);
    nodes = nodes.next;
  }
}
