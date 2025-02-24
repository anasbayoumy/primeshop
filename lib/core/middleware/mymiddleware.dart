import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:primeshop/core/constants/routes.dart';
import 'package:primeshop/core/services/services.dart';

class Mymiddleware extends GetMiddleware {
  @override
  int? priority = 1;
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: AppRoutes.Home);
    }
    if (myServices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}
