import 'package:SutasPersonel/core/constants/colors.dart';
import 'package:SutasPersonel/generated/locale_keys.g.dart';
import 'package:SutasPersonel/view/profil_screen/profil_view_model.dart';
import 'package:flutter/material.dart';
import '../../core/extension/context_entension.dart';
import '../../core/extension/string_extension.dart';

class ProfilScreenView extends ProfilScreenViewModel {
  bool isTheme = false;
  bool isLanguage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.chevron_left, color: AllColors.MAIN_GREEN),
        title: Text(
          LocaleKeys.profile_Profile.locale.toUpperCase(),
          style:
              context.textTheme.headline6.copyWith(color: AllColors.MAIN_GREEN),
        ),
        actions: [Icon(Icons.menu, color: AllColors.MAIN_GREEN)],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/profilBanner.png"))),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: context.normalValue),
                      child: CircleAvatar(
                        backgroundColor: AllColors.ONBOARDING_GRAY,
                        child: Text(
                          'FE',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: context.height * 0.10,
                      width: context.width * 0.5,
                      decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15))),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(context.normalValue),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text("FatihEmre",
                                      style: context.textTheme.headline6),
                                ),
                              ),
                              Container(
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text("Flutter Developer",
                                      style: context.textTheme.bodyText2
                                          .copyWith(
                                              color:
                                                  AllColors.ONBOARDING_GRAY)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 9,
                child: ListView(
                  children: [
                    ProfilListCard(
                        icon: Icons.settings,
                        title: LocaleKeys.profile_ProfilSettings.locale),
                    ProfilListCard(
                        icon: Icons.language,
                        title: LocaleKeys.profile_Language.locale,
                        isSwitch: isLanguage),
                    ProfilListCard(
                        icon: Icons.brightness_3,
                        title: LocaleKeys.profile_Theme.locale,
                        isSwitch: isTheme),
                    ProfilListCard(
                      icon: Icons.exit_to_app,
                      title: LocaleKeys.profile_Exit.locale,
                      click: () {
                        print("exit");
                      },
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class ProfilListCard extends StatefulWidget {
  final Function click;
  final String title;
  final IconData icon;
  bool isSwitch;
  ProfilListCard({
    Key key,
    this.title,
    this.icon,
    this.isSwitch,
    this.click,
  }) : super(key: key);

  @override
  _ProfilListCardState createState() => _ProfilListCardState();
}

class _ProfilListCardState extends State<ProfilListCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: GestureDetector(
            onTap: widget.click == null ? null : widget.click,
            child: ListTile(
              leading: Icon(widget.icon),
              title: Text(widget.title),
              trailing: widget.isSwitch == null
                  ? null
                  : Switch(
                      value: widget.isSwitch,
                      onChanged: (val) {
                        setState(() {
                          widget.isSwitch = val;
                        });
                      }),
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
