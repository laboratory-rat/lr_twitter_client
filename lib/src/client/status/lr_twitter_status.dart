import '../../../lr_twitter_client.dart';
import '../lr_twiter_component.dart';

import 'dart:async';
import 'package:http/http.dart' as http;

class LrTwitterStatus extends LrTwitterComponent {
  LrTwitterStatus(LrTwitterClient client) : super(client);

  Future<LrTwitterResponseList<TwitterDataTweet>> userTimelineById(int userId,
      {int sinceId, int count, int maxId, bool trimUser = true, bool excludeReplies = true, bool includeRts = false}) async {
    return await userTimeline(
        userId: userId, sinceId: sinceId, count: count, maxId: maxId, trimUser: trimUser, includeRts: includeRts, excludeReplies: excludeReplies);
  }

  Future<LrTwitterResponseList<TwitterDataTweet>> userTimelineByName(String screenName,
      {int sinceId, int count, int maxId, bool trimUser = true, bool excludeReplies = true, bool includeRts = false}) async {
    return await userTimeline(
        screenName: screenName, sinceId: sinceId, count: count, maxId: maxId, trimUser: trimUser, includeRts: includeRts, excludeReplies: excludeReplies);
  }

  Future<LrTwitterResponseList<TwitterDataTweet>> userTimeline(
      {int userId, String screenName, int sinceId, int count, int maxId, bool trimUser = true, bool excludeReplies = true, bool includeRts = false}) async {
    if (userId == null && screenName == null) throw new Exception('Can not shearch with no id and screen name');

    var qq = new Map();

    if (userId == null) {
      qq['screen_name'] = screenName;
    } else {
      qq['user_id'] = userId;
    }

    if (sinceId != null) qq['since_id'] = sinceId;
    if (count != null) qq['count'] = count;
    if (maxId != null) qq['max_id'] = maxId;

    qq['trim_user'] = trimUser.toString();
    qq['exclude_replies'] = excludeReplies.toString();
    qq['include_rts'] = includeRts.toString();

    var httpResponse = await http.get(url.statusUserTimeline + url.encode(qq), headers: client.headers);

    var response = new LrTwitterResponseList<TwitterDataTweet>.fromHttp(httpResponse);
    return response;
  }
}
