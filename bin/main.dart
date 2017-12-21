import 'dart:async';
import 'package:lr_twitter_client/lr_twitter_client.dart';

import 'key_storage.dart' as storage;

Future main() async{
    var client = new LrTwitterClient.fromApp(storage.key, storage.secret);
    await client.getToken();

    var twResponse = await client.status.userTimelineByName('@History_Ukraine', count: 50, excludeReplies: false, trimUser: false, includeRts: true);

    var userName = twResponse.response[0].user.screen_name;

    var result = new List<Pair>();
    for (var tweet in twResponse.response) {
        var sinceId = tweet.id;

        var searchResponse = await client.search.tweets('to:' + userName, since_id: sinceId, count: 50);
        if(searchResponse.isSuccess && searchResponse.response.statuses.isNotEmpty){
            var p = new Pair();
            p.tweet = tweet;
            p.responses = searchResponse.response.statuses;
            
            result.add(p);
        }
    }

    print(result);

}

class Pair{
    TwitterDataTweet tweet;
    List<TwitterDataTweet> responses = new List<TwitterDataTweet>();
}