#include <iostream>
#include <string>
#include <vector>
#include <set>
using namespace std;

class Solution {
public:
    int countConsistentStrings(string allowed, vector<string>& words) {
      int ans = 0;
      set<char> allowedChars(allowed.begin(), allowed.end());
      for (string word : words) {
        set<char> tempChars;
        for(char c : word) {
          tempChars.insert(c);
        }
        bool isConsistent = true;
        for(char c : tempChars) {
          if (allowedChars.find(c) == allowedChars.end()) {
            isConsistent = false; 
            break;
          }
        }
        if (isConsistent) {
          ans++;
        }
      }
      return ans;
    }
};