import 'package:SutasPersonel/core/constants/colors.dart';
import 'package:SutasPersonel/models/news_model.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../core/extension/context_entension.dart';
import '../../core/extension/string_extension.dart';
import '../../generated/locale_keys.g.dart';

class TimeFlowCard extends StatelessWidget {
  final NewsModel flowCard;
  final bool isHomeScreen;

  List<Map<String, dynamic>> socialMedia = [
    {
      "icon": FontAwesome.instagram,
      "color": AllColors.INSTAGRAM_PURPLE,
      "click": () => debugPrint("instagram")
    },
    {
      "icon": FontAwesome.facebook,
      "color": AllColors.LINKEDIN_BLUE,
      "click": () => debugPrint("facebook")
    },
    {
      "icon": FontAwesome.linkedin_square,
      "color": AllColors.LINKEDIN_BLUE,
      "click": () => debugPrint("linkedin"),
    },
    {
      "icon": FontAwesome.whatsapp,
      "color": AllColors.WHATSAPP_GREEN,
      "click": () => debugPrint("whatsapp")
    },
  ];

  TimeFlowCard({
    Key key,
    this.flowCard,
    this.isHomeScreen = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.lowValue),
      child: Container(
        decoration: BoxDecoration(
          color: context.theme.primaryColor,
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
              child: timeFlowCardHeader(context),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: context.lowValue, right: context.normalValue),
              child: timeFlowCardDateAndTime(context),
            ),
            timeFlowCardImage(),
            isHomeScreen
                ? SizedBox.shrink()
                : Padding(
                    padding: EdgeInsets.only(
                        top: context.lowValue,
                        left: context.normalValue,
                        right: context.normalValue),
                    child: timeFlowCardSocialMediaArea(context),
                  ),
            isHomeScreen ? SizedBox.shrink() : Divider(),
            Padding(
              padding: EdgeInsets.all(context.normalValue),
              child: isHomeScreen
                  ? timeFlowCardShortDesc(context)
                  : timeFlowCardDesc(),
            )
          ],
        ),
      ),
    );
  }

  Row timeFlowCardShortDesc(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 9,
          child: Container(
              child: AutoSizeText(flowCard.content,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  maxLines: 3,
                  style: context.textTheme.caption.copyWith(height: 1.5))),
        ),
        Flexible(
            flex: 1,
            child: Center(
                child: Icon(Icons.chevron_right,
                    color: AllColors.ONBOARDING_GRAY)))
      ],
    );
  }

  Text timeFlowCardDesc() => Text(flowCard.content);

  Row timeFlowCardSocialMediaArea(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.cardDetail_socialMediaShareText.locale.toUpperCase(),
          style: context.textTheme.caption.copyWith(
              color: AllColors.LINKEDIN_BLUE, fontWeight: FontWeight.w500),
        ),
        Spacer(),
        ...List.generate(
            socialMedia.length,
            (index) => SizedBox(
                  width: context.width * 0.07,
                  child: IconButton(
                      padding: EdgeInsets.symmetric(vertical: context.lowValue),
                      onPressed: socialMedia[index]["click"],
                      icon: Icon(socialMedia[index]["icon"]),
                      color: socialMedia[index]["color"],
                      iconSize: context.width * 0.05),
                ))
      ],
    );
  }

  Image timeFlowCardImage() {
    return Image.network(
      flowCard.image,
      fit: BoxFit.fitWidth,
    );
  }

  Container timeFlowCardDateAndTime(BuildContext context) {
    return Container(
        alignment: Alignment.centerRight,
        child: Text(
          flowCard.date,
          style: context.textTheme.overline.copyWith(
              color: AllColors.ONBOARDING_GRAY,
              letterSpacing: 0.15,
              fontWeight: FontWeight.w200),
        ));
  }

  Container timeFlowCardHeader(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: AutoSizeText(
        flowCard.title,
        style:
            context.textTheme.subtitle1.copyWith(fontWeight: FontWeight.w500),
        textAlign: TextAlign.left,
        maxLines: 2,
      ),
    );
  }
}
