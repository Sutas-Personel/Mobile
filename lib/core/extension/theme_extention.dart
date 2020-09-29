import 'package:SutasPersonel/core/constants/app_theme_enum.dart';
import 'package:flutter/widgets.dart';
import 'package:easy_localization/easy_localization.dart';

extension StringLocalization on String {
  String get locale => this.tr();
}

extension LocaleExtension on Locale {
  String get localeTag => this.toLanguageTag().split("-").last;
}

extension ThemeTypeExtension on String {
  AppThemes get toThemeEnum {
    switch (this) {
      case "AppThemes.LIGHT":
        return AppThemes.LIGHT;
      case "AppThemes.DARK":
        return AppThemes.DARK;
      default:
        return AppThemes.LIGHT;
    }
  }
}
