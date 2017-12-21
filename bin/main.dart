import 'dart:async';
import 'package:lr_twitter_client/lr_twitter_client.dart';

import 'key_storage.dart' as storage;

Future main() async{
    var client = new LrTwitterClient.fromApp(storage.key, storage.secret);
    await client.getToken();

    var response = await client.status.userTimelineByName('@neural_machine', count: 10, excludeReplies: false, trimUser: false, includeRts: true);
    print(response);

}