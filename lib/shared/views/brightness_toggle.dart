import 'package:flutter/material.dart';

import '../models/theme_settings.dart';

class BrightnessToggle extends StatelessWidget {
  const BrightnessToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return IconButton(
      icon: Theme.of(context).brightness == Brightness.light
          ? const Icon(Icons.brightness_3)
          : const Icon(Icons.brightness_7),
      onPressed: () {
        final newSettings = ThemeSettings(
          themeMode: isDark ? ThemeMode.light : ThemeMode.dark,
        );
        ThemeSettingChange(settings: newSettings).dispatch(context);
      },
    );
  }
}
