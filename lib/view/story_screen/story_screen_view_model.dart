import 'package:SutasPersonel/core/init/navigation/navigation_service.dart';
import 'package:SutasPersonel/models/story_model.dart';
import 'package:flutter/material.dart';

import 'story_screen.dart';

abstract class StoryScreenViewModel extends State<StoryScreen> with BaseViewModel{
//user modelden örnel data
  List<StoryModel> stories;
  String id;
  
}
abstract class BaseViewModel {
  NavigationService navigation = NavigationService.instance;
}

