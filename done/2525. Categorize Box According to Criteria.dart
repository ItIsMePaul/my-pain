class Solution {
  String categorizeBox(int l, int w, int h, int m) {
    bool isBulky =
        l * w * h >= 1000000000 || l >= 10000 || w >= 10000 || h >= 10000;
    bool isHeavy = m >= 100;

    if (isBulky && isHeavy) return "Both";

    if (isBulky) return "Bulky";

    if (isHeavy) return "Heavy";

    return "Neither";
  }
}
