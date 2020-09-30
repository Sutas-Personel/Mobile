import 'package:flutter/material.dart';

import '../../core/components/story_card_lists.dart';
import '../../core/components/time_flow_card.dart';
import '../../core/constants/colors.dart';
import '../../core/extension/context_entension.dart';
import '../../core/extension/future_builder.dart';
import '../../core/extension/string_extension.dart';
import '../../generated/locale_keys.g.dart';
import '../../services/story_services.dart';
import 'cardDetail_view_model.dart';

class CardDetailView extends CardDetailViewModel {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.chevron_left, color: AllColors.MAIN_GREEN)),
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
              storyPage(),
              TimeFlowCard(
                flowCard: newsGet,
                isHomeScreen: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget storyPage() {
    return Future.value(StoryService.instance.getStoryList()).toBuild<Object>(
        onSuccess: (data) {
      return StoryCardLists(stories: data);
    });
  }
}
