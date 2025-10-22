class Bitset {
  late List<String> _bitset;
  late int _zeros;
  int _ones = 0;
  bool _flipped = false;
  Bitset(int size) {
    _bitset = List.filled(size, '0');
    _zeros = size;
  }

  void fix(int idx) {
    if (_flipped) {
      if (_bitset[idx] == '1') {
        _bitset[idx] = '0';
        _zeros++;
        _ones--;
      }
    } else {
      if (_bitset[idx] == '0') {
        _bitset[idx] = '1';
        _zeros--;
        _ones++;
      }
    }
  }

  void unfix(int idx) {
    if (_flipped) {
      if (_bitset[idx] == '0') {
        _bitset[idx] = '1';
        _zeros--;
        _ones++;
      }
    } else {
      if (_bitset[idx] == '1') {
        _bitset[idx] = '0';
        _zeros++;
        _ones--;
      }
    }
  }

  void flip() {
    _flipped = !_flipped;
  }

  bool all() {
    if (_flipped) {
      return _ones == 0;
    } else {
      return _zeros == 0;
    }
  }

  bool one() {
    if (_flipped) {
      return _zeros > 0;
    } else {
      return _ones > 0;
    }
  }

  int count() {
    if (_flipped) {
      return _zeros;
    } else {
      return _ones;
    }
  }

  String toString() {
    StringBuffer s = StringBuffer();
    for (var bit in _bitset) {
      if (_flipped) {
        s.write(bit == '0' ? '1' : '0');
      } else {
        s.write(bit);
      }
    }
    return s.toString();
  }
}

/**
 * Your Bitset object will be instantiated and called as such:
 * Bitset obj = Bitset(size);
 * obj.fix(idx);
 * obj.unfix(idx);
 * obj.flip();
 * bool param4 = obj.all();
 * bool param5 = obj.one();
 * int param6 = obj.count();
 * String param7 = obj.toString();
 */
