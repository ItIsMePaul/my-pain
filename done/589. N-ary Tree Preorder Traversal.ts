
class _Node {
    val: number
    children: _Node[]
    constructor(val?: number, children?: _Node[]) {
        this.val = (val===undefined ? 0 : val)
        this.children = (children===undefined ? [] : children)
   }
}
 


function preorder(root: _Node | null): number[] {
  let res: number[] = [];
  let stack: _Node[] = [];
    if (root) stack.push(root);
    while (stack.length > 0) {
        let node = stack.pop()!;
        res.push(node.val);
        for (let i = node.children.length - 1; i >= 0; i--) {
            stack.push(node.children[i]);
        }
    }
    return res;
};