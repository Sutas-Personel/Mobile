import 'package:flutter/foundation.dart';

import 'user_service_model.dart';

User user = User(
  name: 'Sütaş',
  profileImageUrl:
      'https://www.sutas.com.tr/uploads/setting/seo/6281b9c4a8e57cb110cdda5bdc06ffbc.png',
);

Story story = Story(
    url: "http://lorempixel.com/640/480/city",
    media: MediaType.image,
    duration: const Duration(seconds: 3),
    user: user);

List<Story> storyList = List.generate(6, (index) => story);

//------------------------------
//--------------------------------

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
