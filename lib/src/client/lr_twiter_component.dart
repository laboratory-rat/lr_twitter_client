import '../tools/api_url.dart';
import 'lr_twitter_client.dart';

class LrTwitterComponent {
  LrTwitterClient client;
  ApiUrl get url => client?.url; 

  LrTwitterComponent(this.client);
}
