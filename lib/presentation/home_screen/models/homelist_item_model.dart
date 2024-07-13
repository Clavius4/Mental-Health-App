import '../../../core/app_export.dart';

/// This class is used in the [homelist_item_widget] screen.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class HomelistItemModel {
  HomelistItemModel({this.userone, this.happy, this.id}) {
    userone = userone ?? ImageConstant.imgUser;
    happy = happy ?? "Happy";
    id = id ?? "";
  }

  String? userone;

  String? happy;

  String? id;
}
