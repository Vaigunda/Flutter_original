import 'package:flutter/material.dart';

import '../shared/models/theme_settings.dart';
import 'color_schemes.g.dart';

class ThemeProvider extends InheritedWidget {
  const ThemeProvider(
      {super.key,
      required this.settings,
      required this.lightDynamic,
      required this.darkDynamic,
      required super.child});

  final ValueNotifier<ThemeSettings> settings;
  final ColorScheme? lightDynamic;
  final ColorScheme? darkDynamic;

  final pageTransitionsTheme = const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      // TargetPlatform.linux: NoAnimationPageTransitionsBuilder(),
      // TargetPlatform.macOS: NoAnimationPageTransitionsBuilder(),
      // TargetPlatform.windows: NoAnimationPageTransitionsBuilder(),
    },
  );

  ShapeBorder get shapeMedium => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      );

  CardTheme cardTheme(ColorScheme colors) {
    return CardTheme(
        elevation: 0,
        shape: shapeMedium,
        clipBehavior: Clip.antiAlias,
        color: colors.onSurface);
  }

  ListTileThemeData listTileTheme(ColorScheme colors) {
    return ListTileThemeData(
        shape: shapeMedium,
        selectedColor: colors.secondary,
        tileColor: colors.onPrimary);
  }

  AppBarTheme appBarTheme(ColorScheme colors) {
    return AppBarTheme(
      elevation: 0,
      backgroundColor: colors.surface,
      foregroundColor: colors.onSurface,
    );
  }

  TabBarTheme tabBarTheme(ColorScheme colors) {
    return TabBarTheme(
      labelColor: colors.secondary,
      unselectedLabelColor: colors.onSurfaceVariant,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colors.secondary,
            width: 2,
          ),
        ),
      ),
    );
  }

  BottomAppBarTheme bottomAppBarTheme(ColorScheme colors) {
    return BottomAppBarTheme(
      color: colors.surface,
      elevation: 0,
    );
  }

  BottomNavigationBarThemeData bottomNavigationBarTheme(ColorScheme colors) {
    return BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: colors.surfaceContainerHighest,
      selectedItemColor: colors.onSurface,
      unselectedItemColor: colors.onSurfaceVariant,
      elevation: 0,
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
    );
  }

  NavigationRailThemeData navigationRailTheme(ColorScheme colors) {
    return const NavigationRailThemeData();
  }

  DrawerThemeData drawerTheme(ColorScheme colors) {
    return DrawerThemeData(
      backgroundColor: colors.surface,
    );
  }

  ChipThemeData chipThemeData(ColorScheme colors) {
    return ChipThemeData(
      backgroundColor: colors.onPrimary,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(16),
      ),
      side: BorderSide.none,
    );
  }

  IconThemeData iconThemeData(ColorScheme colors) {
    return IconThemeData(size: 20, color: colors.primary);
  }

  ThemeData light() {
    return ThemeData.light().copyWith(
      pageTransitionsTheme: pageTransitionsTheme,
      colorScheme: lightColorScheme,
      appBarTheme: appBarTheme(lightColorScheme),
      cardTheme: cardTheme(lightColorScheme),
      listTileTheme: listTileTheme(lightColorScheme),
      bottomAppBarTheme: bottomAppBarTheme(lightColorScheme),
      bottomNavigationBarTheme: bottomNavigationBarTheme(lightColorScheme),
      navigationRailTheme: navigationRailTheme(lightColorScheme),
      tabBarTheme: tabBarTheme(lightColorScheme),
      drawerTheme: drawerTheme(lightColorScheme),
      scaffoldBackgroundColor: lightColorScheme.surface,
      chipTheme: chipThemeData(lightColorScheme),
      iconTheme: iconThemeData(lightColorScheme),
    );
  }

  ThemeData dark() {
    return ThemeData.dark().copyWith(
      pageTransitionsTheme: pageTransitionsTheme,
      colorScheme: darkColorScheme,
      appBarTheme: appBarTheme(darkColorScheme),
      cardTheme: cardTheme(darkColorScheme),
      listTileTheme: listTileTheme(darkColorScheme),
      bottomAppBarTheme: bottomAppBarTheme(darkColorScheme),
      bottomNavigationBarTheme: bottomNavigationBarTheme(darkColorScheme),
      navigationRailTheme: navigationRailTheme(darkColorScheme),
      tabBarTheme: tabBarTheme(darkColorScheme),
      drawerTheme: drawerTheme(darkColorScheme),
      scaffoldBackgroundColor: darkColorScheme.surface,
      chipTheme: chipThemeData(darkColorScheme),
      iconTheme: iconThemeData(darkColorScheme),
    );
  }

  ThemeMode themeMode() {
    return settings.value.themeMode;
  }

  ThemeData theme(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.light ? light() : dark();
  }

  static ThemeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>()!;
  }

  @override
  bool updateShouldNotify(covariant ThemeProvider oldWidget) {
    return oldWidget.settings != settings;
  }
}
