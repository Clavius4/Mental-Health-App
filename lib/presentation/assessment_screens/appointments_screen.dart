import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:heet/presentation/assessment_screens/assessment1_screen.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_circleimage.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'provider/appointments_provider.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  AppointmentsScreenState createState() => AppointmentsScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppointmentsProvider(),
      child: AppointmentsScreen(),
    );
  }
}

class AppointmentsScreenState extends State<AppointmentsScreen> {
  int _selectedIndex = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  String? _firstName;


  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DatabaseReference userRef = _database.ref().child('users').child(user.uid);
      DataSnapshot snapshot = await userRef.get();
      if (snapshot.exists) {
        Map<String, dynamic> userData = Map<String, dynamic>.from(snapshot.value as Map);
        setState(() {
          _firstName = userData['firstName'];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray50,
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 15.v),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 215.h,
                      margin: EdgeInsets.only(left: 25.h),
                    ),
                    SizedBox(height: 120.v),
              _buildTodayStack(context, xOffset: 0.0, yOffset: -120.0),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 70.v,
      leadingWidth: 60.h,
      leading: AppbarLeadingCircleimage(
        imagePath: ImageConstant.imgEllipse2,
        margin: EdgeInsets.only(
          left: 25.h,
          top: 1.v,
        ),
      ),
      actions: [
        Container(
          height: 30.v,
          width: 32.h,
          margin: EdgeInsets.only(
            left: 12.h,
            right: 12.h,
            bottom: 5.v,
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgVector,
                height: 20.v,
                width: 19.h,
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.only(
                  top: 10.v,
                  right: 13.h,
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgVectorGray800,
                height: 3.v,
                width: 4.h,
                alignment: Alignment.topCenter,
                margin: EdgeInsets.fromLTRB(7.h, 7.v, 21.h, 20.v),
              ),
            ],
          ),
        )
      ],
    );
  }


  /// Section Widget
  Widget _buildTodayStack(BuildContext context, {double xOffset = 0.0, double yOffset = 0.0}) {
    bool isPressed = false;

    void _navigateToAssessmentScreen(BuildContext context) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Assessment1Screen()));
    }

    return Transform.translate(
      offset: Offset(xOffset, yOffset),
      child: Align(
        alignment: Alignment.center,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          margin: EdgeInsets.only(),
          color: appTheme.lightBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusStyle.roundedBorder20,
          ),
          child: Container(
            height: 600.v,
            width: 325.h,
            decoration: AppDecoration.fillLightBlue.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder20,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgMaskGroup,
                  height: 31.v,
                  width: 258.h,
                  radius: BorderRadius.circular(15.h),
                  alignment: Alignment.bottomRight,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.h, right: 26.h, bottom: 100.v),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi ${_firstName ?? ''}!".tr,
                          style: CustomTextStyles.titleLargeEpilogueGray800,
                        ),
                        SizedBox(height: 40.v),
                        Container(
                          padding: EdgeInsets.all(8.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.h),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Text(
                            "Each Assessment consists of a series of questions, which should be answered honestly and in one sitting.".tr,
                            style: CustomTextStyles.bodyMediumRubikGray800,
                          ),
                        ),
                        SizedBox(height: 100.v),
                        Padding(
                          padding: EdgeInsets.fromLTRB(100, 0, 0, 0), // Adjust the values as needed
                          child: ElevatedButton(
                            onPressed: () {
                              _navigateToAssessmentScreen(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isPressed ? Colors.deepPurple : Colors.lightBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.h),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.h),
                            ),
                            onLongPress: () {
                              setState(() {
                                isPressed = true;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("GOT IT"), // Removed .tr for simplification
                                  SizedBox(width: 5.h), // Ensure you have a context for '.h'
                                ],
                              ),
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
