import 'package:test/test.dart';
import 'package:lr_twitter_client/lr_twitter_client.dart';

import 'key_storage.dart' as storage;

// create key storage or just input here key and secret from your app

main() {
  var client = new LrTwitterClient.fromApp(storage.key, storage.secret);

  // group('Connection', () {
  //   test('simple', () async {
  //     var response = await client.accountVerifyCredentials();
  //     expect(response, isNotNull);
  //   });
  // });
}
