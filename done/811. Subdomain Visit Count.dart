class Solution {
  List<String> subdomainVisits(List<String> cpdomains) {
    Map<String, int> map = {};
    for (var cpdomain in cpdomains) {
      List<String> domains = cpdomain.split(' ')[1].split('.');
      int visits = int.parse(cpdomain.split(' ')[0]);
      for (var i = 0; i < domains.length; i++) {
        String currentDomain = domains.sublist(i).join('.');
        map[currentDomain] = (map[currentDomain] ?? 0) + visits;
      }
    }
    List<String> result = [];
    for (var key in map.keys) {
      result.add(map[key].toString() + ' ' + key);
    }
    return result;
  }
}
