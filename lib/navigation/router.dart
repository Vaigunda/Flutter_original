import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:mentor/components/authentication/forget_password/forget_password.screen.dart';
import 'package:mentor/components/authentication/forget_password/new_password.screen.dart';
import 'package:mentor/components/authentication/forget_password/success_reset_password.screen.dart';
import 'package:mentor/components/authentication/forget_password/verify_code.screen.dart';
import 'package:mentor/components/authentication/sign_in/presentation/login.screen.dart';
import 'package:mentor/components/authentication/sign_up/presentation/sign_up.screen.dart';
import 'package:mentor/components/become_mentor/become_mentor.screen.dart';
import 'package:mentor/components/booking/booking.screen.dart';
import 'package:mentor/components/inbox/inbox.screen.dart';
import 'package:mentor/components/main_home/main_home.screen.dart';
import 'package:mentor/components/profile/profile.screen.dart';
import 'package:mentor/components/profile_mentor/profile_mentor.screen.dart';
import 'package:mentor/components/schedule/schedule.screen.dart';
import 'package:mentor/components/search/filter.screen.dart';
import 'package:mentor/components/search/search.screen.dart';
import 'package:mentor/components/settings/setting_teaching_schedule.screen.dart';
import 'package:mentor/components/settings/settings.screen.dart';
import 'package:mentor/components/splash/spash.screen.dart';

import '../components/notification/notification.screen.dart';
import '../shared/views/root_layout.dart';

const _pageKey = ValueKey('_pageKey');
const _scaffoldKey = ValueKey('_scaffoldKey');

class AppRoutes {
  static String root = "/";
  static String home = "/home";
  static String signin = "/signin";
  static String signup = "/signup";
  static String mySchedule = "/my-schedule";
  static String search = "/search";
  static String filter = "/filter";
  static String notifications = "/notifications";
  static String inbox = "/inbox";
  static String profile = "/profile";
  static String forgetPassword = "/forget-password";
  static String newPassword = "/new-password";
  static String verifyCode = "/verify-code";
  static String successResetPassword = "/success-reset-password";
  static String settings = "/settings";
  static String profileMentor = '/profile-mentor';
  static String bookingMentor = '/booking-mentor';
  static String becomeMentor = '/become-mentor';
  static String settingTeachingSchedule = '/setting-teaching-schedule';
}

// navigation list
List<NavigationDestination> destinations = [
  NavigationDestination(
    label: 'Home',
    icon: const Icon(
      FontAwesomeIcons.house,
      size: 20,
    ),
    route: AppRoutes.home,
  ),
  NavigationDestination(
    label: 'Schedule',
    icon: const Icon(
      FontAwesomeIcons.listCheck,
      size: 20,
    ),
    route: AppRoutes.mySchedule,
  ),
  NavigationDestination(
    label: 'Search',
    icon: const Icon(
      FontAwesomeIcons.magnifyingGlass,
      size: 20,
    ),
    route: AppRoutes.search,
  ),
  NavigationDestination(
    label: 'Inbox',
    icon: const Icon(
      FontAwesomeIcons.comment,
      size: 20,
    ),
    route: AppRoutes.inbox,
  ),
  NavigationDestination(
    label: 'Profile',
    icon: const Icon(
      FontAwesomeIcons.user,
      size: 20,
    ),
    route: AppRoutes.profile,
  ),
];

class NavigationDestination {
  const NavigationDestination({
    required this.route,
    required this.label,
    required this.icon,
    this.child,
  });

  final String route;
  final String label;
  final Icon icon;
  final Widget? child;
}

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.root,
      pageBuilder: (context, state) => const MaterialPage<void>(
        key: _pageKey,
        child: SplashScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.home,
      pageBuilder: (context, state) => const MaterialPage<void>(
        key: _pageKey,
        child: RootLayout(
          key: _scaffoldKey,
          currentIndex: 0,
          child: MainHomeScreen(),
        ),
      ),
    ),
    GoRoute(
      path: AppRoutes.mySchedule,
      pageBuilder: (context, state) => const MaterialPage<void>(
        key: _pageKey,
        child: RootLayout(
          key: _scaffoldKey,
          currentIndex: 1,
          child: ScheduleScreen(),
        ),
      ),
    ),
    GoRoute(
      path: AppRoutes.search,
      pageBuilder: (context, state) => const MaterialPage<void>(
        key: _pageKey,
        child: RootLayout(
          key: _scaffoldKey,
          currentIndex: 2,
          child: SearchScreen(),
        ),
      ),
    ),
    GoRoute(
        path: AppRoutes.filter,
        builder: (context, state) => const FilterScreen()),
    GoRoute(
        path: AppRoutes.inbox,
        pageBuilder: (context, state) => const MaterialPage<void>(
              key: _pageKey,
              child: RootLayout(
                key: _scaffoldKey,
                currentIndex: 3,
                child: InboxScreen(),
              ),
            )),
    GoRoute(
        path: AppRoutes.profile,
        pageBuilder: (context, state) => const MaterialPage<void>(
              key: _pageKey,
              child: RootLayout(
                key: _scaffoldKey,
                currentIndex: 4,
                child: ProfileScreen(),
              ),
            )),
    GoRoute(
        path: AppRoutes.signin,
        builder: (context, state) => const LoginScreen()),
    GoRoute(
        path: AppRoutes.signup,
        builder: (context, state) => const SignUpScreen()),
    GoRoute(
        path: AppRoutes.forgetPassword,
        builder: (context, state) => const ForgetPasswordScreen()),
    GoRoute(
        path: AppRoutes.newPassword,
        builder: (context, state) => const NewPasswordScreen()),
    GoRoute(
        path: '${AppRoutes.verifyCode}/:email',
        builder: (context, state) =>
            VerifyCodeScreen(email: state.pathParameters['email']!)),
    GoRoute(
        path: AppRoutes.successResetPassword,
        builder: (context, state) => const SuccessResetScreen()),
    GoRoute(
        path: AppRoutes.settings,
        builder: (context, state) => const SettingsScreen()),
    GoRoute(
        path: '${AppRoutes.profileMentor}/:id',
        builder: (context, state) =>
            ProfileMentorScreen(profileId: state.pathParameters['id']!)),
    GoRoute(
        path: '${AppRoutes.bookingMentor}/:id',
        builder: (context, state) =>
            BookingScreen(profileId: state.pathParameters['id']!)),
    GoRoute(
        path: AppRoutes.notifications,
        builder: (context, state) => const NotificationScreen()),
    GoRoute(
        path: '${AppRoutes.becomeMentor}/:id',
        builder: (context, state) =>
            BecomeMentorScreen(profileId: state.pathParameters['id']!)),
    GoRoute(
        path: AppRoutes.settingTeachingSchedule,
        builder: (context, state) => const SettingTeachingScheduleScreen()),
  ],
);
