class _Node {
  val: number
  children: _Node[]
  constructor(val?: number, children?: _Node[]) {
    this.val = (val===undefined ? 0 : val)
    this.children = (children===undefined ? [] : children)
  }
}

function maxDepth(root: _Node | null): number {
  if (root == null) return 0;
  let currentQueue: _Node[] = [root!];
  let nextQueue: _Node[] = [];
  let result = 0;
  while (currentQueue.length > 0) {
    let temp = currentQueue.pop();
    if (temp) nextQueue.push(...temp.children);
    if (currentQueue.length == 0) {
      currentQueue.push(...nextQueue);
      nextQueue = [];
      result++;
    }
  }
  return result;
};