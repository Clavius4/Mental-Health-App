import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/counselllor_matching_model.dart';

/// A provider class for the CounselllorMatchingScreen.
///
/// This provider manages the state of the CounselllorMatchingScreen, including the
/// current counselllorMatchingModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class CounselllorMatchingProvider extends ChangeNotifier {
  CounselllorMatchingModel counselllorMatchingModelObj =
      CounselllorMatchingModel();

  @override
  void dispose() {
    super.dispose();
  }
}
