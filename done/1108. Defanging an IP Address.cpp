#include <iostream>
#include <string>
using namespace std;

class Solution {
public:
    string defangIPaddr(string address) {
        string ans = "";
        for (int i = 0; i < address.length(); i++) {
          if (address[i] == '.') {
            ans.append("[.]");
          } else {
            ans.append(1, address[i]);
          }
        }
        return ans;
    }
};