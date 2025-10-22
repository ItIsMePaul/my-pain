/**
 * // This is the Iterator's API interface.
 * // You should not implement it, or speculate about its implementation
 * class Iterator {
 *      hasNext(): boolean {}
 *
 *      next(): number {}
 * }
 */

class PeekingIterator {
  numbers: number[] = [];
  constructor(iterator: Iterator) {
    while (iterator.hasNext()) {
      this.numbers.push(iterator.next());
    }
  }

  peek(): number {
    return this.numbers.at(0);
  }

  next(): number {
    return this.numbers.shift();
  }

  hasNext(): boolean {
    return this.numbers.length > 0;
  }
}

/**
 * Your PeekingIterator object will be instantiated and called as such:
 * var obj = new PeekingIterator(iterator)
 * var param_1 = obj.peek()
 * var param_2 = obj.next()
 * var param_3 = obj.hasNext()
 */