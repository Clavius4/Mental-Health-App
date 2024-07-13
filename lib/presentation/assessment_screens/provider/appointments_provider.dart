import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../models/appointments_model.dart';
import '../models/userprofilelist_item_model.dart';

/// A provider class for the AppointmentsScreen.
///
/// This provider manages the state of the AppointmentsScreen, including the
/// current appointmentsModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AppointmentsProvider extends ChangeNotifier {
  AppointmentsModel appointmentsModelObj = AppointmentsModel();

  @override
  void dispose() {
    super.dispose();
  }

  onSelected(dynamic value) {
    for (var element in appointmentsModelObj.dropdownItemList) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    notifyListeners();
  }
}
