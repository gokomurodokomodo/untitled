import 'dart:convert';
import 'dart:developer';

mixin ShowLog {
  void showRequest(String url, dynamic body) {
    log('''
    ----------REQUEST BODY----------
    url: $url
    ${body == null ? 'EMPTY REQUEST' : jsonToPrettyString(body)}
    ''');
  }

  void showResponse(String url, dynamic json) {
    log('''
    ----------RESPONSE BODY----------
    url: $url
    ${jsonToPrettyString(json)}
    ''');
  }

  void showStatus(dynamic json) {
    log('''
    ----------RESPONSE STATUS----------
    ${jsonToPrettyString(json)}
    ''');
  }

  String jsonToPrettyString(dynamic json) {
    try {
      const encoder = JsonEncoder.withIndent('  ');
      const fromStr = '\n';
      const replaceStr = '\n    ';
      final logStr = encoder.convert(json).replaceAll(fromStr, replaceStr);
      return logStr;
    } catch(_) {
      return json.toString();
    }
  }

  String queryToString(Map<String, dynamic>? map) {
    if (map == null) return '';
    var queryStr = '?';

    map.forEach((key, value) {
      queryStr += '$key=$value&';
    });

    return queryStr.substring(0, queryStr.length - 1);
  }
}