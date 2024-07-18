import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../journals/journals.dart';
import 'provider/home_provider.dart';





class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: HomeScreen(),
    );
  }
}

class HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
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
    ThemeData theme = Theme.of(context);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: appTheme.gray50,
          // appBar: _buildAppBar(context),
          body: SingleChildScrollView(
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 25.v),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 215.h,
                        margin: EdgeInsets.only(left: 25.h),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Welcome Back".tr,
                                style: CustomTextStyles.headlineMediumMedium,
                              ),
                              TextSpan(
                                text: "lbl".tr,
                                style: CustomTextStyles.headlineMediumSemiBold,
                              ),
                              TextSpan(
                                text: _firstName ?? '',
                                style: theme.textTheme.headlineMedium!.copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(
                                text: "lbl2".tr,
                                style: theme.textTheme.headlineMedium,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 25.v),
                      Padding(
                        padding: EdgeInsets.only(left: 25.h),
                        child: Text(
                          "msg_how_are_you_feeling".tr,
                          style: CustomTextStyles.titleMediumOnPrimaryContainer,
                        ),
                      ),
                      SizedBox(height: 30.v),
                      SizedBox(height: 33.v),
                      _buildCounsellingRow(context),
                      SizedBox(height: 25.v),
                      _buildBetterToRow(context),
                      SizedBox(height: 27.v),
                      _buildTodayStack(context),
                      SizedBox(height: 40.v),
                      _buildToday2Stack(context),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  /// Section Widget
  Widget _buildCounsellingRow(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(
          left: 28.h,
          right: 6.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 155.h,
              padding: EdgeInsets.symmetric(
                horizontal: 15.h,
                vertical: 19.v,
              ),
              decoration: AppDecoration.fillGray10002.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder17,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgIonJournal,
                    height: 21.v,
                    width: 22.h,
                    margin: EdgeInsets.only(bottom: 1.v),
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 15.h,
                        top: 2.v,
                        bottom: 5.v,
                      ),
                      child: Text(
                        "Journals".tr,
                        style: CustomTextStyles.titleSmallEpilogueGray800,
                      ),
                    ),
                    onTap: () {
                      // Add your onTap logic here
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => JournalsScreen(),
                      )
                      );
                    },
                  )
                ],
              ),
            ),
            GestureDetector(
              child: CustomElevatedButton(
                height: 62.v,
                width: 170.h,
                text: "Reports".tr,
                margin: EdgeInsets.only(left: 15.h),
                leftIcon: Container(
                  margin: EdgeInsets.only(right: 6.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgIcroundarticle,
                    height: 24.v,
                    width: 26.h,
                  ),
                ),
                buttonStyle: CustomButtonStyles.fillGray,
                buttonTextStyle: CustomTextStyles.labelMediumEpilogueGray800,
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBetterToRow(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(
          left: 28.h,
          right: 21.h,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 11.h,
          vertical: 17.v,
        ),
        decoration: AppDecoration.outlineGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder17,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Container(
                width: 246.h,
                margin: EdgeInsets.only(
                  left: 3.h,
                  top: 2.v,
                ),
                child: Text(
                  "msg_it_is_better_to".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    height: 1.43,
                  ),
                ),
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgTelevision,
              height: 20.v,
              width: 24.h,
              margin: EdgeInsets.only(
                left: 26.h,
                top: 11.v,
                bottom: 10.v,
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTodayStack(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        margin: EdgeInsets.all(0),
        color: appTheme.indigo50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusStyle.roundedBorder20,
        ),
        child: Container(
          height: 138.v,
          width: 325.h,
          decoration: AppDecoration.fillIndigo.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder20,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgMaskGroup,
                height: 31.v,
                width: 258.h,
                radius: BorderRadius.circular(
                  15.h,
                ),
                alignment: Alignment.bottomRight,
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20.h,
                    right: 26.h,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "lbl_to_day".tr,
                        style: CustomTextStyles.titleLargeEpilogueGray800,
                      ),
                      SizedBox(height: 7.v),
                      Opacity(
                        opacity: 0.9,
                        child: SizedBox(
                          width: 279.h,
                          child: Text(
                            "msg_free_group_therapy".tr,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.bodyMediumRubikGray800
                                .copyWith(
                              height: 1.29,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 13.v),
                      Row(
                        children: [
                          Text(
                            "msg_book_your_slot_now".tr,
                            style: theme.textTheme.titleMedium,
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgIcOutlineDateRange,
                            height: 13.v,
                            width: 17.h,
                            margin: EdgeInsets.only(
                              left: 7.h,
                              bottom: 4.v,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildToday2Stack(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        margin: EdgeInsets.all(0),
        color: appTheme.indigo50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusStyle.roundedBorder20,
        ),
        child: Container(
          height: 138.v,
          width: 325.h,
          decoration: AppDecoration.fillIndigo.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder20,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgMaskGroup,
                height: 31.v,
                width: 258.h,
                radius: BorderRadius.circular(
                  15.h,
                ),
                alignment: Alignment.bottomRight,
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20.h,
                    right: 26.h,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Talk To Someone".tr,
                        style: CustomTextStyles.titleLargeEpilogueGray800,
                      ),
                      SizedBox(height: 7.v),
                      Opacity(
                        opacity: 0.9,
                        child: SizedBox(
                          width: 279.h,
                          child: Text(
                            "Share your thoughts with a certified therapist, friend or a chat bot".tr,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.bodyMediumRubikGray800
                                .copyWith(
                              height: 1.29,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 13.v),
                      Row(
                        children: [
                          Text(
                            "Know More".tr,
                            style: theme.textTheme.titleMedium,
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgIcOutlineDateRange,
                            height: 13.v,
                            width: 17.h,
                            margin: EdgeInsets.only(
                              left: 7.h,
                              bottom: 4.v,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure?'),
        content: Text('Do you want to exit the app?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('OK'),
          ),
        ],
      ),
    )) ?? false;
  }


}
