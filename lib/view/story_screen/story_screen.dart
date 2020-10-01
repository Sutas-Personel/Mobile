import 'package:SutasPersonel/models/story_model.dart';
import 'package:flutter/material.dart';

import 'story_screen_view.dart';

class StoryScreen extends StatefulWidget {
  final List<StoryModel> stories;
  final int indexClick;

  StoryScreen({Key key, this.stories, this.indexClick});

  @override
  StoryScreenView createState() =>
      new StoryScreenView(stories: stories, currentIndex: indexClick);
}
