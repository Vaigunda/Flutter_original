import 'package:desktop_window/desktop_window.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:mentor/themes/theme.provider.dart';
import 'package:universal_platform/universal_platform.dart';

import 'navigation/router.dart';
import 'shared/models/theme_settings.dart';

Future setDesktopWindow() async {
  await DesktopWindow.setMinWindowSize(const Size(400, 400));
  await DesktopWindow.setWindowSize(const Size(1300, 900));
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (UniversalPlatform.isDesktop) {
    setDesktopWindow();
  }

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final settings = ValueNotifier(ThemeSettings(
    themeMode: ThemeMode.system,
  ));
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) => ThemeProvider(
        lightDynamic: lightDynamic,
        darkDynamic: darkDynamic,
        settings: settings,
        child: NotificationListener<ThemeSettingChange>(
          onNotification: (notification) {
            settings.value = notification.settings;
            return true;
          },
          child: ValueListenableBuilder<ThemeSettings>(
              valueListenable: settings,
              builder: (context, value, _) {
                final theme = ThemeProvider.of(context);
                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  title: 'Find your best mentor',
                  theme: theme.light(),
                  darkTheme: theme.dark(),
                  themeMode: theme.themeMode(),
                  // routeInformationParser: appRouter.routeInformationParser,
                  // routeInformationProvider: appRouter.routeInformationProvider,
                  // routerDelegate: appRouter.routerDelegate,
                  routerConfig: appRouter,
                );
              }),
        ),
      ),
    );
  }
}
