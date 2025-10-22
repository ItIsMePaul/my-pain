class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? removeNthFromEnd(ListNode? head, int n) {
    ListNode? current = head;
    int size = 0;
    while (current != null) {
      current = current.next;
      size++;
    }
    int position = size - n;
    if (position == 0) {
      return head!.next;
    }
    current = head;
    for (var i = 0; i < size - n - 1; i++) {
      current = current?.next;
    }
    current!.next = current.next!.next;
    return head;
  }
}

void main() {
  ListNode? list = ListNode(
    1,
    ListNode(2, ListNode(3, ListNode(4, ListNode(5)))),
  );
  Solution().removeNthFromEnd(list, 2);
}
