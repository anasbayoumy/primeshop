import 'package:get/get.dart';
import 'package:primeshop/core/class/statusrequest.dart';
import 'package:primeshop/core/functions/handlingdata.dart';
import 'package:primeshop/core/services/services.dart';
import 'package:primeshop/data/datasource/remote/home.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
}

class HomeControllerImp extends HomeController {
  String? username;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  homeData homedata = homeData(Get.find());
  List categories = [];

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
