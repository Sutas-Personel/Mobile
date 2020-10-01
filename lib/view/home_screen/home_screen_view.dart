import '../../core/components/story_card_lists.dart';
import '../../core/constants/navigation_constants.dart';
import '../../services/notifications_services.dart';
import '../../services/story_services.dart';
import 'package:flutter/material.dart';

import '../../core/components/time_flow_card.dart';
import '../../core/constants/colors.dart';
import '../../core/extension/context_entension.dart';
import '../../core/extension/future_builder.dart';
import '../../core/extension/string_extension.dart';
import '../../generated/locale_keys.g.dart';
import '../../models/news_model.dart';
import '../../services/news_services.dart';
import '../card_detail_screen/cardDetail.dart';
import 'home_screen_view_model.dart';

class HomeScreenView extends HomeScreenViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.home_name.locale.toUpperCase(),
            style: context.textTheme.headline6),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: context.normalValue),
            child: Icon(Icons.menu, color: context.theme.focusColor),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [storyPage(), contentPage()],
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

  Widget contentPage() {
    return Future.value(NewsService.instance.getNewsList()).toBuild<Object>(
        onSuccess: (data) {
      return homeCardList(data);
    });
  }

  ListView homeCardList(List<NewsModel> listNews) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: listNews.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            navigation.navigateToPage(
                path: NavigationConstants.CARD_DETAIL,
                data: listNews[index].sId);
          },
          child: TimeFlowCard(
            flowCard: listNews[index],
          ),
        );
      },
    );
  }
}
