import 'package:intl/intl.dart';

class ApiUrl {
    String base = 'https://api.twitter.com/';
    String version = '1.1';

    final DateFormat dateFormat = new DateFormat('yyyy-MM-dd');

    ApiUrl([String versionToUse]){
        if(versionToUse != null){
            version = versionToUse;
        }
    }

    String encode(Map params){
        if(params == null || params.isEmpty) return "";
        
        var list = [];
        params.forEach((key, value){
            if(value != null) list.add(key + '=' + value.toString());
        });
        
        return '?' + list.join('&');
    }



    String get oauth => [base, 'oauth2/token'].join();

    String get accountVerifyCredentials => [base, version, '/account/verify_credentials.json'].join();

    // search
    String get searchTweets => [base, version, '/search/tweets.json'].join();
}