import 'package:SutasPersonel/core/components/time_flow_card.dart';
import 'package:SutasPersonel/model/time_flow_card_service_model.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/extension/context_entension.dart';
import '../../core/extension/string_extension.dart';
import '../../generated/locale_keys.g.dart';
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
              ? Container(
                  height: context.height * 0.15,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) => StoryCard(),
                  ),
                )
              : TimeFlowCard(
                  flowCard: content,
                );
        },
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
