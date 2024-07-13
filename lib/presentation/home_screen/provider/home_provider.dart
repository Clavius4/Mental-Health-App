import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/home_model.dart';
import '../models/homelist_item_model.dart';

/// A provider class for the HomeScreen.
///
/// This provider manages the state of the HomeScreen, including the
/// current homeModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class HomeProvider extends ChangeNotifier {
  HomeModel homeModelObj = HomeModel();

  @override
  void dispose() {
    super.dispose();
  }
}
