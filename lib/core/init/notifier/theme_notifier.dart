import 'package:SutasPersonel/core/constants/app_theme_enum.dart';
import 'package:SutasPersonel/core/constants/locale_keys_enum.dart';
import 'package:SutasPersonel/core/init/cache/locale_manager.dart';
import 'package:SutasPersonel/core/init/theme/dark_theme.dart';
import 'package:SutasPersonel/core/init/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:SutasPersonel/core/extension/theme_extention.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme;

  ThemeData get currentTheme {
    AppThemes defaultTheme = LocaleManager.instance
            .getStringValue(PreferencesKeys.THEME)
            .toThemeEnum ??
        AppThemes.LIGHT;
    _currentTheme = findTheme(defaultTheme);
    return _currentTheme;
  }

  ThemeData findTheme(AppThemes theme) {
    if (theme == AppThemes.LIGHT) {
      return myLightTheme;
    } else {
      return myDarkTheme;
    }
  }

  AppThemes currentThemeEnum() {
    AppThemes defaultTheme = LocaleManager.instance
            .getStringValue(PreferencesKeys.THEME)
            .toThemeEnum ??
        AppThemes.LIGHT;
    return defaultTheme;
  }

  void changeTheme() {
    AppThemes defaultTheme = LocaleManager.instance
            .getStringValue(PreferencesKeys.THEME)
            .toThemeEnum ??
        AppThemes.LIGHT;
    if (defaultTheme == AppThemes.LIGHT)
      defaultTheme = AppThemes.DARK;
    else
      defaultTheme = AppThemes.LIGHT;
    _currentTheme = findTheme(defaultTheme);
    LocaleManager.instance
        .setStringValue(PreferencesKeys.THEME, defaultTheme.toString());
    notifyListeners();
  }

  void setTheme(AppThemes theme) {
    _currentTheme = findTheme(theme);
    LocaleManager.instance
        .setStringValue(PreferencesKeys.THEME, theme.toString());
    notifyListeners();
  }
}
