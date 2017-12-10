import 'i_twitter_data_base.dart';

class TwitterDataToken extends ITwitterDataBase {
  String access_token;
  String token_type;

  @override
  void decode(Map map) {
    access_token = map['access_token'];
    token_type = map['token_type'];
  }

  @override
  Map encode() {
    var m = new Map();

    m['access_token'] = access_token;
    m['token_type'] = token_type;

    return m;
  }
}
