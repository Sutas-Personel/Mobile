import 'package:SutasPersonel/core/components/story_card_lists.dart';
import 'package:SutasPersonel/generated/locale_keys.g.dart';
import 'package:SutasPersonel/model/story_servis_model.dart';
import 'package:SutasPersonel/view/card_detail_screen/cardDetail.dart';
import 'package:flutter/material.dart';

import '../../core/components/time_flow_card.dart';
import '../../core/constants/colors.dart';
import '../../core/extension/context_entension.dart';
import '../../model/time_flow_card_service_model.dart';
import 'home_screen_view_model.dart';
import '../../core/extension/string_extension.dart';

class HomeScreenView extends HomeScreenViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.chevron_left, color: AllColors.MAIN_GREEN),
        title: Text(
          LocaleKeys.home_name.locale.toUpperCase(),
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
              : GestureDetector(
                  onTap: () {
                    return Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CardDetail()),
                    );
                  },
                  child: TimeFlowCard(
                    flowCard: content,
                  ),
                );
        },
      ),
    );
  }
}
