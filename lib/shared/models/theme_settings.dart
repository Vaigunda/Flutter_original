import 'package:flutter/material.dart';

class ThemeSettingChange extends Notification {
  ThemeSettingChange({required this.settings});
  final ThemeSettings settings;
}

class ThemeSettings {
  ThemeSettings({
    required this.themeMode,
  });

  final ThemeMode themeMode;
}
