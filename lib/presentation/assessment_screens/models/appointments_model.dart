import '../../../core/app_export.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import 'userprofilelist_item_model.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AppointmentsModel {
  List<SelectionPopupModel> dropdownItemList = [
    SelectionPopupModel(
      id: 1,
      title: "Item One",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Item Two",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Item Three",
    )
  ];

  List<UserprofilelistItemModel> userprofilelistItemList = [
    UserprofilelistItemModel(
        userImage: ImageConstant.imgEllipse24,
        userName: "Suhana M",
        userEducation: "Msc in Clinical Psychology",
        stmay: ImageConstant.imgIcOutlineDateRange,
        eventDate: "1st May ‘23",
        stmay1: ImageConstant.imgWiTime2,
        eventTime: "7:30 PM - 8:30 PM",
        joinnow: "Join Now"),
    UserprofilelistItemModel(
        userImage: ImageConstant.imgEllipse25,
        userName: "Sana K",
        userEducation: "Msc in Clinical Psychology",
        joinnow: "Give Feedback"),
    UserprofilelistItemModel(
        userImage: ImageConstant.imgEllipse26,
        userName: "Sahana V",
        userEducation: "Msc in Clinical Psychology",
        joinnow: "View Profile")
  ];
}
