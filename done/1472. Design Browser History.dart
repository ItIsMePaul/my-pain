class BrowserHistory {
  List<String> visited = [];
  int position = 0;
  BrowserHistory(String homepage) {
    visited.add(homepage);
  }

  void visit(String url) {
    visited.removeRange(position + 1, visited.length);
    visited.add(url);
    position++;
  }

  String back(int steps) {
    position = position - steps < 0 ? 0 : position - steps;
    return visited[position];
  }

  String forward(int steps) {
    position = position + steps >= visited.length
        ? visited.length - 1
        : position + steps;
    return visited[position];
  }
}

/**
 * Your BrowserHistory object will be instantiated and called as such:
 * BrowserHistory obj = BrowserHistory(homepage);
 * obj.visit(url);
 * String param2 = obj.back(steps);
 * String param3 = obj.forward(steps);
 */