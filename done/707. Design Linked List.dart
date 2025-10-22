class Node {
  int val;
  Node? nextNode;

  Node({required this.val, this.nextNode});
}

class MyLinkedList {
  Node? head;
  int length = 0;
  MyLinkedList({this.head});

  String toString() {
    Node? curr = head;
    if (curr == null) return 'null';
    StringBuffer buffer = StringBuffer();
    buffer.write(curr.val);
    curr = curr.nextNode;
    while (curr != null) {
      buffer.write(' -> ');
      buffer.write(curr.val);
      curr = curr.nextNode;
    }
    return buffer.toString();
  }

  int get(int index) {
    int counter = 0;
    Node? curr = head;
    while (curr != null) {
      if (counter == index) {
        return curr.val;
      }
      curr = curr.nextNode;
      counter++;
    }
    return -1;
  }

  void addAtHead(int val) {
    length++;
    if (head == null) {
      head = Node(val: val);
      return;
    }
    head = Node(val: val, nextNode: head);
  }

  void addAtTail(int val) {
    length++;
    if (head == null) {
      head = Node(val: val);
      return;
    }
    Node curr = head!;
    while (curr.nextNode != null) {
      curr = curr.nextNode!;
    }
    curr.nextNode = Node(val: val);
  }

  void addAtIndex(int index, int val) {
    if (index > length) return;
    if (index == 0) {
      addAtHead(val);
      return;
    }
    if (length == index) {
      addAtTail(val);
      return;
    }
    length++;
    if (head == null) {
      head = Node(val: val);
      return;
    }

    int counter = 0;
    Node? prev = null;
    Node? curr = head;
    while (curr != null) {
      if (counter == index) {
        prev!.nextNode = Node(val: val, nextNode: curr);
        return;
      }
      prev = curr;
      curr = curr.nextNode;
      counter++;
    }
  }

  void deleteAtIndex(int index) {
    if (index >= length || index < 0) {
      return;
    }
    length--;
    if (index == 0) {
      head = head!.nextNode;
      return;
    }
    int counter = 0;
    Node? prev = null;
    Node? curr = head;
    while (curr != null) {
      if (counter == index) {
        prev!.nextNode = curr.nextNode;
        return;
      }
      prev = curr;
      curr = curr.nextNode;
      counter++;
    }
    prev!.nextNode = null;
  }
}

void main() {
  MyLinkedList list = MyLinkedList();
  list.deleteAtIndex(0);
  print(list.toString());
  print(list.length);
  list.addAtHead(100);
  list.addAtHead(101);
  list.addAtTail(102);
  print(list.toString());
  print(list.length);
  list.addAtIndex(3, 99);
  print(list.toString());
  print(list.length);
  list.addAtIndex(0, 104);
  print(list.toString());
  print(list.length);
  list.deleteAtIndex(0);
  print(list.toString());
  print(list.length);
  list.deleteAtIndex(list.length - 1);
  print(list.toString());
  print(list.length);
  list.deleteAtIndex(list.length ~/ 2);
  print(list.toString());
  print(list.length);
}

/**
 * Your MyLinkedList object will be instantiated and called as such:
 * MyLinkedList obj = MyLinkedList();
 * int param1 = obj.get(index);
 * obj.addAtHead(val);
 * obj.addAtTail(val);
 * obj.addAtIndex(index,val);
 * obj.deleteAtIndex(index);
 */
