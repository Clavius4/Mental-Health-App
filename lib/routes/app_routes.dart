import 'package:flutter/material.dart';
import '../core/app_export.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/assessment_screens/appointments_screen.dart';
import '../presentation/bottom_nav_bar/bottom_nav_bar.dart';
import '../presentation/counselllor_matching_screen/counselllor_matching_screen.dart';
import '../presentation/home_screen/home_screen.dart';
import '../presentation/log_in_screen/log_in_screen.dart';
import '../presentation/profile_screen/profile_screen.dart';
import '../presentation/sign_up_screen/sign_up_screen.dart';
import '../presentation/splash_screen/splash_screen.dart';
import '../presentation/start_screen/start_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String startScreen = '/start_screen';

  static const String bottomNavScreen = '/bottom_nav_bar';

  static const String logInScreen = '/log_in_screen';


  static const String counselllorMatchingScreen =
      '/counselllor_matching_screen';

  static const String appointmentsScreen = '/appointments_screen';

  static const String homeScreen = '/home_screen';
  static const String profileScreen = '/profile_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        splashScreen: SplashScreen.builder,
        startScreen: StartScreen.builder,
        logInScreen: LogInScreen.builder,
        profileScreen: ProfileScreen.builder,
    bottomNavScreen: BottomNavScreen.builder,
    appointmentsScreen: AppointmentsScreen.builder,
    counselllorMatchingScreen: CounselllorMatchingScreen.builder,
        homeScreen: HomeScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: SplashScreen.builder
      };
}
