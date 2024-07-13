import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'models/splash_model.dart';
import 'provider/splash_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );

  @override
  SplashScreenState createState() => SplashScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashProvider(),
      child: SplashScreen(),
    );
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      NavigatorService.popAndPushNamed(
        AppRoutes.startScreen,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 26.v),
          child: Column(
            children: [
              Spacer(
                flex: 61,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgLogo1,
                height: 200.adaptSize,
                width: 200.adaptSize,
              ),
              SizedBox(height: 69.v),
              Text(
                "Ecsthetic".tr,
                style: theme.textTheme.displayMedium?.copyWith(
                  fontFamily: 'Nico Moji'
                ),
              ),
              Spacer(
                flex: 38,
              ),
             // SizedBox(
             //   height: 120.adaptSize,
             //   width: 120.adaptSize,
             //   child: Center(
             //     child: CircularProgressIndicator(),
             //   ),
             // ),
            ],
          ),
        ),
      ),
    );
  }
}
