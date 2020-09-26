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
              : TimeFlowCard();
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

String desc =
    "Aliquip qui veniam pariatur magna Aliquip qui veniam pariatur magnaAliquip qui veniam pariatur magna tempor sunt aliqua adipisicing non aliquip incididunt ad aliqua et.Duis qui mollit labore est sint reprehenderit Lorem cillum.'";

class TimeFlowCard extends StatelessWidget {
  const TimeFlowCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.lowValue),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                spreadRadius: 0,
                blurRadius: 2,
                offset: Offset(0, 2))
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: context.lowValue, horizontal: context.normalValue),
              child: Container(
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  "SÜTAŞ’A MÜŞTERİ DENEYİMİNİ EN İYİ YÖNETEN MARKA ÖDÜLÜ",
                  style: context.textTheme.subtitle1
                      .copyWith(fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                  maxLines: 2,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: context.lowValue, right: context.normalValue),
              child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "05.12.2019 - 16.47",
                    style: context.textTheme.overline.copyWith(
                        color: AllColors.ONBOARDING_GRAY,
                        letterSpacing: 0.15,
                        fontWeight: FontWeight.w200),
                  )),
            ),
            Image.network(
              "https://www.sutas.com.tr/uploads/slides/home/diyar-market/desktop.jpg?20200926125128",
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: EdgeInsets.all(context.normalValue),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 9,
                    child: Container(
                        child: AutoSizeText(desc,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            maxLines: 3,
                            style: context.textTheme.caption
                                .copyWith(height: 1.5))),
                  ),
                  Flexible(
                      flex: 1,
                      child: Center(
                          child: Icon(Icons.chevron_right,
                              color: AllColors.ONBOARDING_GRAY)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
