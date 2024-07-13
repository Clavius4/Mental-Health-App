import '../../../core/app_export.dart';
import 'homelist_item_model.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class HomeModel {
  List<HomelistItemModel> homelistItemList = [
    HomelistItemModel(userone: ImageConstant.imgUser, happy: "Happy"),
    HomelistItemModel(userone: ImageConstant.imgSettings, happy: "Sad"),
    HomelistItemModel(
        userone: ImageConstant.imgSettingsDeepOrange100, happy: "Angry"),
    HomelistItemModel(userone: ImageConstant.imgInbox, happy: "Calm"),
    HomelistItemModel(userone: ImageConstant.imgProfile, happy: "Manic")
  ];
}
