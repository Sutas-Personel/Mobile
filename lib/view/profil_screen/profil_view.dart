import 'package:SutasPersonel/core/components/profile_list_tile_widget.dart';
import 'package:SutasPersonel/core/constants/app_theme_enum.dart';
import 'package:SutasPersonel/core/constants/colors.dart';
import 'package:SutasPersonel/core/init/lang/language_manager.dart';
import 'package:SutasPersonel/core/init/notifier/theme_notifier.dart';
import 'package:SutasPersonel/generated/locale_keys.g.dart';
import 'package:SutasPersonel/view/profil_screen/profil_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/extension/context_entension.dart';
import '../../core/extension/string_extension.dart';

class ProfilScreenView extends ProfilScreenViewModel {
  bool isTheme = false;
  bool isLanguage = false;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeNotifier>(context);
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
            Expanded(
              flex: 10,
              child: ListView(
                children: [
                  ProfileListCard(Icons.settings,
                      LocaleKeys.profile_ProfileSettings.locale),
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
                            WidgetsBinding.instance
                                .addPostFrameCallback((timeStamp) {
                              print("tr");
                              final tr = LanguageManager.instance.trLocale;
                              final en = LanguageManager.instance.enLocale;
                              EasyLocalization.of(context).locale =
                                  context.locale == tr ? en : tr;

                              setState(() {
                                isLanguage = value;
                              });
                            });
                          });
                        }),
                  ),
                  ListTile(
                    leading: Icon(Icons.brightness_3),
                    title: Text(
                      LocaleKeys.profile_Theme.locale,
                      style: context.textTheme.bodyText1,
                    ),
                    trailing: Switch(
                      value: isTheme,
                      onChanged: (value) {
                        setState(() {
                          isTheme = value;
                          themeProvider.changeTheme();
                        });
                      },
                    ),
                  ),
                  ProfileListCard(
                    Icons.exit_to_app,
                    LocaleKeys.profile_Exit.locale,
                  ),
                ],
              ),
            )
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
}
