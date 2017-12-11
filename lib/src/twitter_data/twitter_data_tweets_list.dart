import 'i_twitter_data_base.dart';
import 'twitter_data_search_metadata.dart';
import 'twitter_data_tweet.dart';

class TwitterDataTweetsList extends ITwitterDataBase {
  List<TwitterDataTweet> statuses;
  TwitterataSearchMetadata search_metadata;

  @override
  void decode(Map map) {
    statuses = [];
    map['statuses']?.forEach((x) => statuses.add(new TwitterDataTweet()..decode(x)));
    search_metadata = new TwitterataSearchMetadata()..decode(map['search_metadata']);
  }

  @override
  Map encode() {
    var map = new Map();

    map['statuses'] = statuses?.map((x) => x.encode())?.toList();
    map['search_metadata'] = search_metadata?.encode();

    return map;
  }
}
