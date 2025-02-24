import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:primeshop/core/class/statusrequest.dart';
import 'package:primeshop/core/constants/routes.dart';
import 'package:primeshop/core/functions/handlingdata.dart';
import 'package:primeshop/core/services/services.dart';
import 'package:primeshop/data/datasource/remote/auth/login.dart';

abstract class LoginController extends GetxController {
  login(BuildContext context);
  goToForgetPassword();
  goToSignup();
}

class LoginControllerImp extends LoginController {
  var isPasswordVisible = false.obs;
  late TextEditingController email;
  late TextEditingController password;
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  loginData logindata = loginData(Get.find());

  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value; // Toggle the value
  }

  @override
  goToSignup() {
    Get.toNamed(AppRoutes.SignUp);
  }

  @override
  login(context) async {
    var formData = formState.currentState;
    if (formData != null && formData.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await logindata.postData(email.text, password.text);
      // Log the entire response
      print("Response: $response");
      // Check if response contains expected data
      if (response is Map && response['status'] != null) {
        print("Response Status cont: ${response['status']}");
        print("Response Message cont :  ${response['message']}");
      }
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          myServices.sharedPreferences
              .setString("id", response['data']['users_id']);
          myServices.sharedPreferences
              .setString("username", response['data']['users_name']);
          myServices.sharedPreferences
              .setString("email", response['data']['users_email']);
          myServices.sharedPreferences
              .setString("phone", response['data']['users_phone']);
          myServices.sharedPreferences.setString("step", "2");
          Get.offNamed(AppRoutes.Home);
        } else {
          AwesomeDialog(
            dismissOnTouchOutside: false,
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Error',
            desc: "Password Or Email is wrong , please try again",
            descTextStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            btnOkOnPress: () {},
            btnOkColor: const Color(0xffa600ff),
            btnOkText: "Retry",
          ).show();
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    // // Ensure Firebase is initialized before accessing it
    // if (Firebase.apps.isEmpty) {
    //   throw Exception("Firebase has not been initialized.");
    // }
    FirebaseMessaging.instance.getToken().then((value) {
      print("==============================================");
      print("==============================================");
      print("==============================================");
      print("token is: $value");
      print(value);
      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.ForgetPassword);
  }
}
