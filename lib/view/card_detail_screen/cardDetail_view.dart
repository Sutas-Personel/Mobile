import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'cardDetail_view_model.dart';

import 'package:auto_size_text/auto_size_text.dart';
import '../../core/constants/colors.dart';
import '../../core/extension/context_entension.dart';
import '../../core/extension/string_extension.dart';
import '../../generated/locale_keys.g.dart';

String desc =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ullamcorper neque vitae massa posuere, sed eleifend ex cursus. Duis dignissim rutrum nunc, ac condimentum eros aliquet facilisis. Proin elementum elementum tincidunt. Donec libero sem, tempus ut massa vel, sodales fermentum urna. Nulla facilisi. Maecenas porta lorem nec lectus efficitur maximus. Fusce non bibendum neque, ac malesuada eros.\nDonec consectetur nec velit a blandit. Etiam iaculis quam sit amet ante feugiat suscipit. Nam in purus vitae turpis ornare suscipit. Aliquam interdum elit a nunc sollicitudin, sed blandit mi dignissim. Proin eu sapien congue, consectetur mauris ut, fringilla sapien. Sed mauris sapien, tempor eu pharetra eget, mattis eget nisl. Donec mi urna, iaculis vel ornare et, pharetra ut mauris. Donec eu nisi neque. Cras magna libero, convallis a tristique vel, ornare eget lacus. Nullam quis gravida libero. Quisque id diam lorem. Vivamus a leo libero. Curabitur blandit nibh ut ipsum interdum, sed tincidunt justo mollis. Curabitur in dolor at est vehicula sagittis.\nUt eu justo sed odio vulputate semper. Suspendisse venenatis magna magna, a auctor dui suscipit scelerisque. Ut iaculis arcu vehicula ullamcorper tristique. Etiam auctor euismod finibus. Nam volutpat mauris mi, a congue libero sollicitudin et. Aliquam erat volutpat. Donec sit amet magna fermentum, imperdiet sapien vitae, viverra tortor. Aliquam vulputate turpis eu ipsum suscipit sollicitudin.\nDonec tincidunt rutrum nisl et pulvinar. Nulla finibus orci at neque posuere, non maximus dui faucibus. Mauris posuere egestas diam, ac fringilla nisl viverra sit amet. Nulla fringilla ultrices diam non convallis. Ut a feugiat orci. Morbi in nulla sit amet libero aliquam tristique ac eu velit. Phasellus egestas, est sed bibendum ultrices, urna dui suscipit quam, ut tincidunt est orci eget erat. Sed pulvinar ipsum non purus eleifend, ut dapibus nunc pulvinar. Mauris feugiat lorem sed libero placerat, vitae suscipit leo vehicula. Sed et lectus eget est malesuada mattis eget quis leo. Nunc laoreet rhoncus mi ut dapibus. Nulla posuere hendrerit orci quis ornare. Suspendisse convallis lectus sit amet purus cursus ultrices. In turpis libero, elementum nec erat et, mattis pharetra erat. Quisque molestie dui non tempor mattis. Praesent sodales rhoncus mauris sed mollis.\nAenean nec molestie augue. Fusce posuere lectus eu maximus accumsan. Praesent non varius tellus. Maecenas mattis consequat nulla, eu eleifend felis posuere nec. Aliquam malesuada est non augue rhoncus, eget mollis ex facilisis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean rutrum lacinia orci, in interdum diam egestas ut. Proin quis fringilla est. Maecenas est mi, pellentesque quis mattis a, commodo sed leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Proin dapibus lectus sit amet dignissim dignissim. Praesent eget laoreet justo. Praesent vulputate quam in suscipit rutrum. In egestas commodo ultricies. Duis mattis rhoncus luctus.";

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

class CardDetailView extends CardDetailViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              storyListArea(context),
              TimeFlowCard(),
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
              padding: EdgeInsets.only(
                  top: context.lowValue,
                  left: context.normalValue,
                  right: context.normalValue),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "İÇERİĞİ SOSYAL MEDYADA PAYLAŞ".toUpperCase(),
                    style: context.textTheme.caption.copyWith(
                        color: AllColors.LINKEDIN_BLUE,
                        fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  ...List.generate(
                      socialMedia.length,
                      (index) => SizedBox(
                            width: context.width * 0.07,
                            child: IconButton(
                                padding: EdgeInsets.symmetric(
                                    vertical: context.lowValue),
                                onPressed: socialMedia[index]["click"],
                                icon: Icon(socialMedia[index]["icon"]),
                                color: socialMedia[index]["color"],
                                iconSize: context.width * 0.05),
                          ))
                ],
              ),
            ),
            Divider(),
            Padding(
                padding: EdgeInsets.all(context.normalValue),
                child: Text(desc)),
          ],
        ),
      ),
    );
  }
}
