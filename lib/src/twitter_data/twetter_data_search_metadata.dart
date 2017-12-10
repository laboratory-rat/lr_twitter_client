import 'i_twitter_data_base.dart';

class TwitterataSearchMetadata extends ITwitterDataBase {
  int count;
  double completed_in;
  String query;

  int max_id;
  String max_id_str;

  int since_id;
  String since_id_str;

  String refresh_url;
  String next_results;

  @override
  void decode(Map map) {
    count = map['cont'];
    completed_in = map['completed_in'];
    query = map['query'];

    max_id = map['max_id'];

    since_id = map['since_id'];
    since_id_str = map['since_id_str'];

    refresh_url = map['refresh_url'];
    next_results = map['next_results'];
  }

  @override
  Map encode() {
    var map = new Map();

    map['cont'] = count;
    map['completed_in'] = completed_in;
    map['query'] = query;

    map['max_id'] = max_id;

    map['since_id'] = since_id;
    map['since_id_str'] = since_id_str;

    map['refresh_url'] = refresh_url;
    map['next_results'] = next_results;

    return map;
  }
}
