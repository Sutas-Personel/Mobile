import 'package:flutter/foundation.dart';

import 'user_service_model.dart';

enum MediaType {
  image,
  video,
}

class Story {
  final String url;
  final MediaType media;
  final Duration duration;
  final User user;

  Story({
    @required this.url,
    @required this.media,
    @required this.duration,
    @required this.user,
  });
}
