class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? insertGreatestCommonDivisors(ListNode? head) {
    int GCD(int a, int b) {
      if (a == 0) return b;
      return GCD(b % a, a);
    }

    int f = head!.val;
    ListNode? newNode = ListNode(f);
    ListNode? result = newNode;
    ListNode? current = result;
    head = head.next;
    while (head != null) {
      int s = head.val;
      head = head.next;
      int gcd = GCD(f, s);
      newNode = ListNode(gcd);
      current!.next = newNode;
      current = newNode;
      newNode = ListNode(s);
      current.next = newNode;
      current = newNode;
      f = s;
    }
    return result;
  }
}
