import 'package:SutasPersonel/core/constants/colors.dart';
import 'package:SutasPersonel/core/init/lang/language_manager.dart';
import 'package:SutasPersonel/generated/locale_keys.g.dart';
import 'package:SutasPersonel/view/profil_screen/profil_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
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
        actions: [
          Padding(
            padding: EdgeInsets.only(right: context.lowValue),
            child: Icon(Icons.menu, color: AllColors.MAIN_GREEN),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(flex: 2, child: profilHeaderArea(context)),
            Expanded(flex: 10, child: profileSettingLists())
          ],
        ),
      ),
    );
  }

  Widget profilHeaderArea(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(fit: BoxFit.cover, image: profilHeaderBanner())),
      child: Padding(
        padding: EdgeInsets.only(
            bottom: context.normalValue, top: context.normalValue),
        child: Row(
          children: [
            profilHeaderUserProfilImage(context),
            Spacer(),
            profilHeaderUserIdenityArea(context)
          ],
        ),
      ),
    );
  }

  Widget profilHeaderUserIdenityArea(BuildContext context) {
    return Container(
      width: context.width * 0.5,
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(context.normalValue),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: userName(context),
                ),
              ),
              Container(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: userJob(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text userJob(BuildContext context) {
    return Text("Flutter Developer",
        style: context.textTheme.caption
            .copyWith(color: AllColors.ONBOARDING_GRAY));
  }

  Text userName(BuildContext context) {
    return Text("Fatih Emre Kalem", style: context.textTheme.bodyText1);
  }

  Padding profilHeaderUserProfilImage(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.normalValue),
      child: CircleAvatar(
        backgroundColor: AllColors.ONBOARDING_GRAY,
        child: Text(
          'FE',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  AssetImage profilHeaderBanner() =>
      AssetImage("assets/images/profilBanner.png");

  ListView profileSettingLists() {
    return ListView(
      children: [
        ProfilListCard(
            icon: Icons.settings,
            title: LocaleKeys.profile_ProfileSettings.locale),
        ListTile(
          leading: Icon(Icons.language),
          title: Text(
            LocaleKeys.profile_Language.locale,
            style: context.textTheme.bodyText1,
          ),
          trailing: Switch(
              value: isLanguage,
              onChanged: (value) {
                setState(() {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    print("tr");
                    final tr = LanguageManager.instance.trLocale;
                    final en = LanguageManager.instance.enLocale;
                    EasyLocalization.of(context).locale =
                        context.locale == tr ? en : tr;
                    isLanguage = !value;
                  });
                });
              }),
        ),
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
              title: Text(
                widget.title,
                style: context.textTheme.bodyText1,
              ),
              trailing:
                  widget.isSwitch == null ? null : profilCardSwitchButton(),
            ),
          ),
        ),
        Divider(),
      ],
    );
  }

  Switch profilCardSwitchButton() {
    return Switch(
        value: widget.isSwitch,
        onChanged: (val) {
          setState(() {
            return widget.isSwitch = val;
          });
        });
  }
}
