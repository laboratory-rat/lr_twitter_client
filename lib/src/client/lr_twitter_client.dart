import '../tools/api_url.dart';
import '../twitter_data/twitter_data_response.dart';
import '../twitter_data/twitter_data_token.dart';
import 'dart:async';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'search/lr_twitter_search.dart';
import 'status/lr_twitter_status.dart';

class LrTwitterClient {
  final String key;
  final String secret;

  TwitterDataToken token;
  bool get isToken => token != null;

  ApiUrl _url;
  ApiUrl get url => _url;

  // components
  LrTwitterSearch search;
  LrTwitterStatus status;

  static const String appUserAgent = 'Lr dart twitter client v0.1';

  Map<String, String> get headers {
    if (!isToken) {
      throw 'No token avaliable';
    }

    var map = new Map();

    map['User-Agent'] = appUserAgent;
    map['Authorization'] = 'Bearer ' + token.access_token;

    return map;
  }

  Map<String, String> get headersAuth {
    var string = key + ':' + secret;
    var bytes = UTF8.encode(string);
    var encoded = BASE64.encode(bytes);

    var map = new Map();
    map['Authorization'] = 'Basic ' + encoded;
    map['Content-Type'] = 'application/x-www-form-urlencoded;charset=UTF-8';
    map['User-Agent'] = appUserAgent;

    return map;
  }

  LrTwitterClient.fromApp(this.key, this.secret, [String apiVersion]) {
    _url = new ApiUrl(apiVersion);

    search = new LrTwitterSearch(this);
    status = new LrTwitterStatus(this);
  }

  Future<TwitterDataToken> getToken() async {
    var response = await http.post(url.oauth, body: 'grant_type=client_credentials', headers: headersAuth);

    var result = new LrTwitterResponse<TwitterDataToken>.fromHttp(response);
    if (result.isSuccess) {
      token = result.response;
      return token;
    }

    return null;
  }
}
