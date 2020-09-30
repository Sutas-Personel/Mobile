import 'package:SutasPersonel/core/init/navigation/navigation_service.dart';
import 'package:SutasPersonel/models/story_model.dart';
import 'package:SutasPersonel/services/interfaces/IStoryServices.dart';
import 'package:SutasPersonel/services/story_services.dart';
import 'package:flutter/material.dart';

import 'story_screen.dart';

abstract class StoryScreenViewModel extends State<StoryScreen>
    with BaseViewModel {
  List<StoryModel> stories;
//user modelden örnel data
  /* List<StoryModel> stories = [
    StoryModel(
      media: "IMAGE",
      url:
          "https://firebasestorage.googleapis.com/v0/b/sutas-personel.appspot.com/o/image1_story.PNG?alt=media&token=96b20d43-86da-4362-b1df-97a98447bdca",
      duration: "3",
      user: "Sütaş",
    ),
    StoryModel(
      media: "IMAGE",
      url:
          "https://firebasestorage.googleapis.com/v0/b/sutas-personel.appspot.com/o/image1_story.PNG?alt=media&token=96b20d43-86da-4362-b1df-97a98447bdca",
      duration: "3",
      user: "Sütaş",
    ),
    StoryModel(
      media: "IMAGE",
      url:
          "https://firebasestorage.googleapis.com/v0/b/sutas-personel.appspot.com/o/image1_story.PNG?alt=media&token=96b20d43-86da-4362-b1df-97a98447bdca",
      duration: "3",
      user: "Sütaş",
    )
  ]; */
  String id;
  IStoryService storyService;

  @override
  void initState() {
    super.initState();
    storyService = StoryService.instance;
    getNotificationsLists();
  }

  Future<void> getNotificationsLists() async {
    setState(() async {
      stories = await storyService.getStoryList();
    });
  }
}

abstract class BaseViewModel {
  NavigationService navigation = NavigationService.instance;
}
