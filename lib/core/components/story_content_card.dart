import 'package:flutter/material.dart';

import '../../core/extension/future_builder.dart';
import '../../services/story_services.dart';
import '../../view/story_screen/story_screen.dart';
import '../init/navigation/navigation_service.dart';

class StoryContentCard extends StatelessWidget {
  final String storyId;

  const StoryContentCard({Key key, this.storyId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Future.value(StoryService.instance.getNewsSearch(storyId))
        .toBuild<Object>(onSuccess: (data) {
      return StoryScreen(stories: [data]);
    });
  }
}
