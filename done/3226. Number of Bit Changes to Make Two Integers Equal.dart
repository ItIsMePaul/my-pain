class Solution {
  int minChanges(int n, int k) {
    String bin(int d) {
      String b = '';
      while (d > 0) {
        int t = d % 2;
        b = '$t' + b;
        d = d ~/ 2;
      }
      return b;
    }

    String equalLength(String s, int n) {
      while (s.length < n) {
        s = '0' + s;
      }
      return s;
    }

    String nBin = bin(n);
    String kBin = bin(k);
    if (nBin.length > kBin.length) {
      kBin = equalLength(kBin, nBin.length);
    }
    if (nBin.length < kBin.length) {
      nBin = equalLength(nBin, kBin.length);
    }
    int result = 0;
    for (var i = 0; i < nBin.length; i++) {
      if (nBin[i] != kBin[i] && nBin[i] == '1') {
        nBin = nBin.replaceRange(i, i + 1, '0');
        result++;
      }
    }
    if (nBin != kBin) {
      return -1;
    } else {
      return result;
    }
  }
}
