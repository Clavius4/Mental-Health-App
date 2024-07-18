import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:heet/presentation/assessment_screens/controllers/assessment_controller.dart';
import 'package:heet/presentation/log_in_screen/provider/log_in_provider.dart';
import 'package:heet/theme/theme_helper.dart';
import 'package:heet/theme/theme_helper.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/app_export.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDY_5ITmK93hMxIspJcwIXtujbBL327EfE",
      appId: '1:652906483451:android:04de96d637d722665b6a5e',
      messagingSenderId: '652906483451',
      projectId: 'heet-2d9e3',
    ),
  );

  // Initialize AssessmentController here
  Get.put(AssessmentController());

  await Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    PrefUtils().init()
  ]);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ThemeProvider()),
            ChangeNotifierProvider(create: (_) => LogInProvider()),
            // Add other providers here if needed
          ],
          child: Consumer<ThemeProvider>(
            builder: (context, provider, child) {
              return GetMaterialApp(
                title: 'heet',
                debugShowCheckedModeBanner: false,
                theme: theme, // Ensure to use the provider theme
                navigatorKey: NavigatorService.navigatorKey,
                localizationsDelegates: [
                  AppLocalizationDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: [Locale('en', '')],
                initialRoute: AppRoutes.initialRoute,
                routes: AppRoutes.routes,
              );
            },
          ),
        );
      },
    );
  }
}
