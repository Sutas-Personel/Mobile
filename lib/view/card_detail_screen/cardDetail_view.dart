import 'package:SutasPersonel/core/components/story_card_lists.dart';
import 'package:SutasPersonel/generated/locale_keys.g.dart';
import 'package:SutasPersonel/model/story_servis_model.dart';
import 'package:flutter/material.dart';

import '../../core/components/time_flow_card.dart';
import '../../core/constants/colors.dart';
import '../../core/extension/context_entension.dart';
import '../../core/extension/string_extension.dart';
import '../../model/time_flow_card_service_model.dart';
import 'cardDetail_view_model.dart';

class CardDetailView extends CardDetailViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.chevron_left, color: AllColors.MAIN_GREEN),
        title: Text(
          LocaleKeys.cardDetail_name.locale.toUpperCase(),
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              storyListArea(context),
              TimeFlowCard(
                flowCard: content,
                isHomeScreen: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  SafeArea storyListArea(BuildContext context) {
    return SafeArea(
      child: StoryCardLists(
        stories: storyList,
      ),
    );
  }
}
