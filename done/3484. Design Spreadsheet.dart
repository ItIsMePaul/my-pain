class Spreadsheet {
  int _rows = 0;
  Map<String, int> _memory = {};
  Spreadsheet(int rows) {
    _rows = rows;
  }

  void setCell(String cell, int value) {
    if (int.parse(cell.substring(1)) > _rows)
      return;
    else
      _memory[cell] = value;
  }

  void resetCell(String cell) {
    _memory.remove(cell);
  }

  int getValue(String formula) {
    List<String> cells = formula.substring(1).split('+');
    int result = 0;
    if (int.tryParse(cells[0]) != null)
      result += int.parse(cells[0]);
    else
      result += _memory[cells[0]] ?? 0;
    if (int.tryParse(cells[1]) != null)
      result += int.parse(cells[1]);
    else
      result += _memory[cells[1]] ?? 0;
    return result;
  }
}

/**
 * Your Spreadsheet object will be instantiated and called as such:
 * Spreadsheet obj = Spreadsheet(rows);
 * obj.setCell(cell,value);
 * obj.resetCell(cell);
 * int param3 = obj.getValue(formula);
 */
