import '../../../core/app_export.dart';

/// This class is used in the [userprofilelist_item_widget] screen.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class UserprofilelistItemModel {
  UserprofilelistItemModel(
      {this.userImage,
      this.userName,
      this.userEducation,
      this.stmay,
      this.eventDate,
      this.stmay1,
      this.eventTime,
      this.joinnow,
      this.id}) {
    userImage = userImage ?? ImageConstant.imgEllipse24;
    userName = userName ?? "Suhana M";
    userEducation = userEducation ?? "Msc in Clinical Psychology";
    stmay = stmay ?? ImageConstant.imgIcOutlineDateRange;
    eventDate = eventDate ?? "1st May ‘23";
    stmay1 = stmay1 ?? ImageConstant.imgWiTime2;
    eventTime = eventTime ?? "7:30 PM - 8:30 PM";
    joinnow = joinnow ?? "Join Now";
    id = id ?? "";
  }

  String? userImage;

  String? userName;

  String? userEducation;

  String? stmay;

  String? eventDate;

  String? stmay1;

  String? eventTime;

  String? joinnow;

  String? id;
}
