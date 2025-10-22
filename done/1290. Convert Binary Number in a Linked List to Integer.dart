class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  int getDecimalValue(ListNode? head) {
    StringBuffer number = StringBuffer();
    while (head != null) {
      number.write(head.val);
      head = head.next;
    }
    return int.parse(number.toString(), radix: 2);
  }
}
