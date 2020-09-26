import 'package:SutasPersonel/core/components/story_card_lists.dart';
import 'package:SutasPersonel/model/story_servis_model.dart';
import 'package:flutter/material.dart';

import '../../core/components/story_card.dart';
import '../../core/components/time_flow_card.dart';
import '../../core/constants/colors.dart';
import '../../core/extension/context_entension.dart';
import '../../model/time_flow_card_service_model.dart';
import 'home_screen_view_model.dart';

class HomeScreenView extends HomeScreenViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.chevron_left, color: AllColors.MAIN_GREEN),
        title: Text(
          "Zaman Akışı".toUpperCase(),
          style:
              context.textTheme.headline6.copyWith(color: AllColors.MAIN_GREEN),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: context.lowValue),
            child: Icon(Icons.menu, color: AllColors.MAIN_GREEN),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return index == 0
              ? StoryCardLists(
                  stories: storyList,
                )
              : TimeFlowCard(
                  flowCard: content,
                );
        },
      ),
    );
  }
}
