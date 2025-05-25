class Solution {
  String validIPAddress(String queryIP) {
    if (queryIP.contains('.')) {
      List<String> parts = queryIP.split('.');
      if (parts.length == 4) {
        for (var part in parts) {
          if (part.startsWith('0')) return 'Neither';
          int? number = int.tryParse(part);
          if (number == null || number > 255 || number < 0) return 'Neither';
        }
        return 'IPv4';
      }
    } else {
      List<String> parts = queryIP.split(':');
      if (parts.length == 8) {
        for (var part in parts) {
          if (part.length > 4) return 'Neither';
          int? number = int.tryParse(part, radix: 16);
          if (number == null || number > 65535 || number < 0) return 'Neither';
        }
        return 'IPv6';
      }
    }
    return 'Neither';
  }
}
