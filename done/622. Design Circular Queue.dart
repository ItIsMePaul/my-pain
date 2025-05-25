class MyCircularQueue {
  int currentQueueSize = 0;
  late int maxQueueSize;
  late List<int> queue;
  int front = -1;
  int rear = -1;

  MyCircularQueue(int k) {
    maxQueueSize = k;
    queue = List.filled(k, -1);
  }

  bool enQueue(int value) {
    if (isFull()) return false;
    if (isEmpty()) {
      front = 0;
    }
    rear = (rear + 1) % maxQueueSize;
    queue[rear] = value;
    currentQueueSize++;
    return true;
  }

  bool deQueue() {
    if (currentQueueSize == 0) return false;
    queue[front] = -1;
    if (front == rear) {
      front = -1;
      rear = -1;
    } else {
      front = (front + 1) % maxQueueSize;
    }
    currentQueueSize--;
    return true;
  }

  int Front() => isEmpty() ? -1 : queue[front];

  int Rear() => isEmpty() ? -1 : queue[rear];

  bool isEmpty() => currentQueueSize == 0;

  bool isFull() => currentQueueSize == maxQueueSize;
}

void main() {
  MyCircularQueue obj = MyCircularQueue(81);
  print(obj.enQueue(69));
  print(obj.deQueue());
  print(obj.enQueue(92));
  print(obj.enQueue(12));
  print(obj.deQueue());
  print(obj.isFull());
  print(obj.isFull());
  print(obj.Front());
}
