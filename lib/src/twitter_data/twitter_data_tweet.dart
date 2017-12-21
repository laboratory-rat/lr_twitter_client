import 'i_twitter_data_base.dart';

class TwitterDataTweet extends ITwitterDataBase {
  String id_str;
  int id;

  String text;

  TwitterDataUser user;

  int retweet_count;
  bool retweeted;

  String created_at;
  DateTime get created_at_parsed => parseTwitterDateTime(created_at);

  String geo;
  String coordinates;

  TwitterDataPlace place;
  String source;

  bool favorited;
  bool truncated;

  TwitterDataEntities entities;

  String in_reply_to_user_id_str;
  String in_reply_to_status_id_str;
  int in_reply_to_user_id;
  int in_reply_to_status_id;
  String in_reply_to_screen_name;

  TwitterDataMetadata metadata;

  @override
  void decode(Map map) {
    id_str = map['id_str'];
    id = map['id'];

    text = map['text'];

    user = new TwitterDataUser()..decode(map['user']);

    retweet_count = map['retweet_count'];
    retweeted = map['retweeted'];

    created_at = map['created_at'];

    geo = map['geo'];
    coordinates = map['coordinates'];

    if (map['place'] != null) {
      place = new TwitterDataPlace()..decode(map['place']);
    }
    source = map['source'];

    favorited = map['favorited'];
    truncated = map['truncated'];

    entities = new TwitterDataEntities()..decode(map['entities']);

    in_reply_to_user_id_str = map['in_reply_to_user_id_str'];
    in_reply_to_status_id_str = map['in_reply_to_status_id_str'];
    in_reply_to_user_id = map['in_reply_to_user_id'];
    in_reply_to_status_id = map['in_reply_to_status_id'];
    in_reply_to_screen_name = map['in_reply_to_screen_name'];

    metadata = new TwitterDataMetadata()..decode(map['metadata']);
  }

  @override
  Map encode() {
    var map = new Map();

    map['id_str'] = id_str;
    map['id'] = id;

    map['text'] = text;

    map['user'] = user.encode();

    map['retweet_count'] = retweet_count;
    map['retweeted'] = retweeted;

    map['created_at'] = created_at;

    map['geo'] = geo;
    map['coordinates'] = coordinates;

    map['place'] = place;
    map['source'] = source;

    map['favorited'] = favorited;
    map['truncated'] = truncated;

    map['entities'] = entities.encode();

    map['in_reply_to_user_id_str'] = in_reply_to_user_id_str;
    map['in_reply_to_status_id_str'] = in_reply_to_status_id_str;
    map['in_reply_to_user_id'] = in_reply_to_user_id;
    map['in_reply_to_status_id'] = in_reply_to_status_id;
    map['in_reply_to_screen_name'] = in_reply_to_screen_name;

    map['metadata'] = metadata.encode();

    return map;
  }
}

class TwitterDataEntities extends ITwitterDataBase {
  TwitterDataEntitiesUrl url;
  TwitterDataEntityDescription description;

  @override
  void decode(Map map) {
    if (map == null) return;

    url = new TwitterDataEntitiesUrl();
    if (map.containsKey('url')) url.decode(map['url']);

    description = new TwitterDataEntityDescription();
    if (map.containsKey('description')) description.decode(map['description']);
  }

  @override
  Map encode() {
    var m = new Map();

    m['url'] = url.encode();
    m['description'] = description.encode();

    return m;
  }
}

class TwitterDataEntitiesUrl extends ITwitterDataBase {
  List<TwitterDataEntitiesUrlElement> urls;

  @override
  void decode(Map map) {
    urls = [];

    if (map.isNotEmpty && map.containsKey('urls')) {
      map['urls'].forEach((x) => urls.add(new TwitterDataEntitiesUrlElement()..decode(x)));
    }
  }

  @override
  Map encode() {
    var m = new Map();

    m['urls'] = urls?.map((x) => x.encode())?.toList();

    return m;
  }
}

class TwitterDataEntitiesUrlElement extends ITwitterDataBase {
  String expanded_url;
  String url;
  List includes;

  @override
  void decode(Map map) {
    expanded_url = map['expanded_url'];
    url = map['url'];
    includes = map['includes'];
  }

  @override
  Map encode() {
    var m = new Map();

    m['expanded_url'] = expanded_url;
    m['url'] = url;
    m['includes'] = includes;

    return m;
  }
}

class TwitterDataEntityDescription extends ITwitterDataBase {
  List urls;

  @override
  void decode(Map map) {
    urls = map['urls'];
  }

  @override
  Map encode() {
    var m = new Map();

    m['urls'] = urls;

    return m;
  }
}

class TwitterDataMetadata extends ITwitterDataBase {
  String iso_language_code;
  String result_type;

  @override
  void decode(Map map) {
    if (map == null) return;

    if (map.containsKey('iso_language_code')) iso_language_code = map['iso_language_code'];
    if (map.containsKey('result_type')) result_type = map['result_type'];
  }

  @override
  Map encode() {
    var m = new Map();

    m['iso_language_code'] = iso_language_code;
    m['result_type'] = result_type;

    return m;
  }
}

class TwitterDataUser extends ITwitterDataBase {
  String id_str;
  int id;
  bool default_profile;

  String name;
  String screen_name;
  String description;
  bool protected;
  bool verified;

  String lang;
  bool is_translator;

  String url;
  String profile_image_url;
  String profile_image_url_https;
  String profile_background_image_url;
  String profile_background_image_url_https;
  bool default_profile_image;

  String created_at;
  DateTime get created_at_parsed => parseTwitterDateTime(created_at);
  String time_zone;
  int utc_offset;

  String location;
  bool geo_enabled;

  int statuses_count;
  int friends_count;
  int listed_count;
  int followers_count;
  int favourites_count;
  bool contributors_enabled;

  String following;
  String notifications;
  String follow_request_sent;

  TwitterDataEntities entities;

  String profile_background_color;
  String profile_sidebar_fill_color;
  String profile_sidebar_border_color;
  String profile_link_color;
  String profile_text_color;

  bool profile_background_tile;
  bool profile_use_background_image;

  bool show_all_inline_media;

  @override
  void decode(Map map) {
    id_str = map['id_str'];
    id = map['id'];
    default_profile = map['default_profile'];

    name = map['name'];
    screen_name = map['screen_name'];
    description = map['description'];
    protected = map['protected'];
    verified = map['verified'];

    lang = map['lang'];
    is_translator = map['is_translator'];

    url = map['url'];
    profile_image_url = map['profile_image_url'];
    profile_image_url_https = map['profile_image_url_https'];
    profile_background_image_url = map['profile_background_image_url'];
    profile_background_image_url_https = map['profile_background_image_url_https'];
    default_profile_image = map['default_profile_image'];

    created_at = map['created_at'];
    utc_offset = map['utc_offset'];

    location = map['location'];
    geo_enabled = map['geo_enabled'];

    statuses_count = map['statuses_count'];
    friends_count = map['friends_count'];
    listed_count = map['listed_count'];
    followers_count = map['followers_count'];
    favourites_count = map['favourites_count'];
    contributors_enabled = map['contributors_enabled'];

    following = map['following'];
    notifications = map['notifications'];
    follow_request_sent = map['follow_request_sent'];

    entities = new TwitterDataEntities()..decode(map['entities']);

    profile_background_color = map['profile_background_color'];
    profile_sidebar_fill_color = map['profile_sidebar_fill_color'];
    profile_sidebar_border_color = map['profile_sidebar_border_color'];
    profile_link_color = map['profile_link_color'];
    profile_text_color = map['profile_text_color'];

    profile_background_tile = map['profile_background_tile'];
    profile_use_background_image = map['profile_use_background_image'];

    show_all_inline_media = map['show_all_inline_media'];
  }

  @override
  Map encode() {
    var map = new Map();

    map['id_str'] = id_str;
    map['id'] = id;
    map['default_profile'] = default_profile;

    map['name'] = name;
    map['screen_name'] = screen_name;
    map['description'] = description;
    map['protected'] = protected;
    map['verified'] = verified;

    map['lang'] = lang;
    map['is_translator'] = is_translator;

    map['url'] = url;
    map['profile_image_url'] = profile_image_url;
    map['profile_image_url_https'] = profile_image_url_https;
    map['profile_background_image_url'] = profile_background_image_url;
    map['profile_background_image_url_https'] = profile_background_image_url_https;
    map['default_profile_image'] = default_profile_image;

    map['created_at'] = created_at;
    map['utc_offset'] = utc_offset;

    map['location'] = location;
    map['geo_enabled'] = geo_enabled;

    map['statuses_count'] = statuses_count;
    map['friends_count'] = friends_count;
    map['listed_count'] = listed_count;
    map['followers_count'] = followers_count;
    map['favourites_count'] = favourites_count;
    map['contributors_enabled'] = contributors_enabled;

    map['following'] = following;
    map['notifications'] = notifications;
    map['follow_request_sent'] = follow_request_sent;

    map['entities'] = entities.encode();

    map['profile_background_color'] = profile_background_color;
    map['profile_sidebar_fill_color'] = profile_sidebar_fill_color;
    map['profile_sidebar_border_color'] = profile_sidebar_border_color;
    map['profile_link_color'] = profile_link_color;
    map['profile_text_color'] = profile_text_color;

    map['profile_background_tile'] = profile_background_tile;
    map['profile_use_background_image'] = profile_use_background_image;

    map['show_all_inline_media'] = show_all_inline_media;

    return map;
  }
}

class TwitterDataPlace extends ITwitterDataBase {
  String id;
  String url;
  String place_type;
  String name;
  String full_name;
  String country_code;
  String country;

  @override
  void decode(Map map) {
    id = map['id'];
    url = map['url'];
    place_type = map['place_type'];
    name = map['name'];
    full_name = map['full_name'];
    country_code = map['country_code'];
    country = map['country'];
  }

  @override
  Map encode() {
    var m = new Map();

    m['id'] = id;
    m['url'] = url;
    m['place_type'] = place_type;
    m['name'] = name;
    m['full_name'] = full_name;
    m['country_code'] = country_code;
    m['country'] = country;

    return m;
  }
}
