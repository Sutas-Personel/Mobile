import 'package:SutasPersonel/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

import '../../core/components/time_flow_card.dart';
import '../../core/constants/colors.dart';
import '../../core/extension/context_entension.dart';
import '../../model/time_flow_card_service_model.dart';
import 'cardDetail_view_model.dart';
import '../../core/extension/string_extension.dart';

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
      child: Container(
        height: context.height * 0.15,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) => StoryCard(),
        ),
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  const StoryCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: context.width * 0.20,
        child: Padding(
          padding: EdgeInsets.all(context.lowValue),
          child: CircleAvatar(
            radius: context.width * 0.08,
            backgroundColor: AllColors.MAIN_GREEN,
            child: CircleAvatar(
              radius: context.width * 0.075,
              backgroundImage: NetworkImage(
                  "https://s3.amazonaws.com/uifaces/faces/twitter/beshur/128.jpg"),
            ),
          ),
        ));
  }
}
