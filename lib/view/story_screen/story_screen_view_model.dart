import 'package:SutasPersonel/models/story_model.dart';
import 'package:flutter/material.dart';

import 'story_screen.dart';

abstract class StoryScreenViewModel extends State<StoryScreen> {
//user modelden örnel data
  List<StoryModel> stories;
  String id;
  
}
