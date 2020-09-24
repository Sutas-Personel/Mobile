import 'dart:ui';

import 'package:SutasPersonel/core/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../core/extension/context_entension.dart';
import '../../core/extension/string_extension.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController(initialPage: 0, keepPage: true);
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "header": "Haberdar Olun",
      "desc":
          "Sütaş ailesinin bir ütesi olduğuna göre ailemizde olan bitenlerden haberdar olmak istemez misin?"
    },
    {
      "header": "Haberdar Olun",
      "desc": "Eiusmod sint Lorem duis occaecat cupidatat eu cillum aute."
    },
    {
      "header": "Haberdar Olun",
      "desc": "Eiusmod sint Lorem duis occaecat cupidatat eu cillum aute."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColors.MAIN_GREEN,
      body: Container(
        width: double.infinity,
        height: context.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/onBoardingBanner.png"),
          ),
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              color: Colors.white10.withOpacity(0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 10,
                  ),
                  Expanded(
                    flex: 85,
                    child: Container(
                      child: PageView.builder(
                          controller: _controller,
                          onPageChanged: (value) {
                            setState(() {
                              currentPage = value;
                            });
                          },
                          itemCount: splashData.length,
                          itemBuilder: (context, index) => OnboardingSliderCard(
                              header: splashData[index]["header"],
                              desc: splashData[index]["desc"])),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => dottedSplashController(index),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: splashNextButton(),
                  ),
                  Spacer(
                    flex: 5,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget splashNextButton() {
    List buttonText = ["Geç", "Başlayın"];
    int isButtonText = currentPage != splashData.length - 1 ? 0 : 1;
    return SizedBox(
      width: context.width * 0.9,
      child: FlatButton(
        splashColor: Colors.green[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: AllColors.BUTTON_WHITE,
        onPressed: () {
          setState(() {
            if (currentPage == splashData.length - 1) {
              splashNavigatonPage();
            }
            splashNextPage(currentPage);
          });
        },
        child: Text(
          buttonText[isButtonText],
          style: context.textTheme.headline6
              .copyWith(color: AllColors.MAIN_LIGHT_GREEN),
        ),
      ),
    );
  }

  splashNextPage(int index) {
    _controller.nextPage(duration: context.lowDuration, curve: Curves.easeIn);
  }

  splashNavigatonPage() {
    print("sign in");
  }

  Widget dottedSplashController(int index) {
    return GestureDetector(
      onHorizontalDragStart: (details) {
        print("başladı");
        print(details);
      },
      child: AnimatedContainer(
        duration: context.lowDuration,
        margin: EdgeInsets.all(3),
        width: context.normalValue,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == currentPage
                ? AllColors.MAIN_GREEN
                : AllColors.BUTTON_WHITE,
            boxShadow: [
              BoxShadow(
                color: Colors.white10.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]),
      ),
    );
  }
}

class OnboardingSliderCard extends StatelessWidget {
  final String header;
  final String desc;
  const OnboardingSliderCard({
    Key key,
    this.header,
    this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            header,
            style: context.textTheme.headline4.copyWith(
                color: AllColors.MAIN_GREEN, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.only(
                right: context.normalValue,
                left: context.normalValue,
                top: context.normalValue),
            child: Text(
              desc,
              style: context.textTheme.bodyText1
                  .copyWith(color: AllColors.ONBOARDING_GRAY),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
