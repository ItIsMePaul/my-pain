class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? oddEvenList(ListNode? head) {
    int size = 0;
    ListNode? curr = head;
    ListNode? end;
    while (curr != null) {
      end = curr;
      curr = curr.next;
      size++;
    }
    int temp = 0;
    curr = head;
    ListNode? prev;
    while (size > temp) {
      if (temp % 2 == 0) {
        if (prev == null) {
          end!.next = ListNode(curr!.val);
          head = head!.next;
        } else {
          end!.next = ListNode(curr!.val);
          prev.next = curr.next;
        }
        end = end.next;
        curr = curr.next;
        temp++;
        continue;
      }
      temp++;
      prev = curr;
      curr = curr!.next;
    }
    return head;
  }
}

void main() {
  ListNode? head = ListNode(
    1,
    ListNode(2, ListNode(3, ListNode(4, ListNode(5)))),
  );
  head = Solution().oddEvenList(head);
  StringBuffer buffer = StringBuffer();
  if (head != null) {
    buffer.write(head.val);
    head = head.next;
  }
  while (head != null) {
    buffer.write(' -> ');
    buffer.write(head.val);
    head = head.next;
  }
  print(buffer.toString());
}
