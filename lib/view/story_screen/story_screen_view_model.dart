import 'package:SutasPersonel/model/story_servis_model.dart';
import 'package:flutter/material.dart';

import 'story_screen.dart';

abstract class StoryScreenViewModel extends State<StoryScreen> {
//user modelden örnel data
  List<Story> stories = storyList;
}
