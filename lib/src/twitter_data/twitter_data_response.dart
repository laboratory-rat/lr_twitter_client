import 'dart:convert';
import 'dart:mirrors';

import 'i_twitter_data_base.dart';
import 'package:http/http.dart';

class LrTwitterResponse<T extends ITwitterDataBase> {
  T response;
  LrTwitterResponseError error;
  String responseString;

  int statucCode;
  bool get isSuccess => statucCode == 200;

  Map<String, String> headers;
  BaseRequest request;

  LrTwitterResponse();
  LrTwitterResponse.fromHttp(Response httpResponse) {
    statucCode = httpResponse.statusCode;
    responseString = httpResponse.body;

    headers = httpResponse.headers;
    request = httpResponse.request;

    if (isSuccess) {
      ClassMirror c = reflectClass(T);
      InstanceMirror im = c.newInstance(const Symbol(''), const []);
      response = im.reflectee;
      response.decodeString(responseString);
    } else {
      response = null;
      error = new LrTwitterResponseError()..decodeString(responseString);
    }
  }
}

class LrTwitterResponseList<T extends ITwitterDataBase> {
  List<T> response;
  LrTwitterResponseError error;
  String responseString;

  List<T> responseList;
  bool isList = false;

  int statucCode;
  bool get isSuccess => statucCode == 200;

  Map<String, String> headers;
  BaseRequest request;

  LrTwitterResponseList();
  LrTwitterResponseList.fromHttp(Response httpResponse) {
    statucCode = httpResponse.statusCode;
    responseString = httpResponse.body;

    headers = httpResponse.headers;
    request = httpResponse.request;

    if (isSuccess) {
      var list = JSON.decode(responseString);
      response = new List<T>();

      for (int i = 0; i < list.length; i++) {
        ClassMirror c = reflectClass(T);
        InstanceMirror im = c.newInstance(const Symbol(''), const []);
        var r = im.reflectee;
        r.decode(list[i]);
        response.add(r);
      }
    } else {
      response = null;
      error = new LrTwitterResponseError()..decodeString(responseString);
    }
  }
}

class LrTwitterResponseError extends ITwitterDataBase {
  List<LrTwitterError> errors;

  @override
  void decode(Map map) {
    errors = [];
    map['errors'].forEach((x) => errors.add(new LrTwitterError()..decode(x)));
  }

  @override
  Map encode() {
    var m = new Map();

    var e = [];
    errors.forEach((x) => e.add(x.encode()));

    m['errors'] = e;

    return m;
  }
}

class LrTwitterError extends ITwitterDataBase {
  String message;
  double code;

  @override
  void decode(Map map) {
    message = map['message'];

    try {
      code = double.parse(map['code']);
    } catch (e) {
      code = double.MIN_POSITIVE;
    }
  }

  @override
  Map encode() {
    var m = new Map();

    m['message'] = message;
    m['code'] = code;

    return m;
  }
}
