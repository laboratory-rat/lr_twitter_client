import '../../twitter_data/twitter_data_response.dart';
import '../../twitter_data/twitter_data_tweets_list.dart';
import '../lr_twiter_component.dart';
import '../lr_twitter_client.dart';

import 'dart:async';
import 'package:http/http.dart' as http;

class LrTwitterSearch extends LrTwitterComponent {
  LrTwitterSearch(LrTwitterClient client) : super(client);

  Future<LrTwitterResponse<TwitterDataTweetsList>> tweets(String q,
      {String geocode, String lang, String locale, String result_type, int count, DateTime until, int since_id, int max_id, bool include_entities}) async {
    var qq = new Map();

    qq['q'] = q;
    qq['geocode'] = geocode;
    qq['lang'] = lang;
    qq['locale'] = locale;
    qq['result_type'] = result_type;
    qq['count'] = count;
    qq['until'] = until != null ? url.dateFormat.format(until) : null;
    qq['since_id'] = since_id;
    qq['max_id'] = max_id;
    qq['include_entities'] = include_entities;

    var httpResponse = await http.get(url.searchTweets + url.encode(qq), headers: client.headers);
    return new LrTwitterResponse<TwitterDataTweetsList>.fromHttp(httpResponse);
  }

}
