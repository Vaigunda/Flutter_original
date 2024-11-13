import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mentor/navigation/router.dart';
import 'package:mentor/shared/utils/extensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).go(AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/app-logo.png',
              fit: BoxFit.cover,
              width: 300,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to",
                  style: context.headlineSmall,
                ),
                Text(
                  " Mentori",
                  style: context.displaySmall,
                ),
              ],
            ),
            Text(
              "PTz mentoring platform",
              style: context.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
