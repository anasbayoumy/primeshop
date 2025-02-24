import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:primeshop/core/class/statusrequest.dart';
import 'package:primeshop/core/constants/routes.dart';

import 'package:primeshop/data/datasource/remote/auth/otpsignup.dart';

abstract class OtpSignupController extends GetxController {
  void goToLogin(BuildContext context, String verifycode);
}

class OtpSignupControllerImp extends OtpSignupController {
  OtpSignupData otpSignupData = OtpSignupData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  String? email;

  @override
  void onInit() {
    email = Get.arguments['email'] ?? '';
    super.onInit();
  }

  @override
  void goToLogin(BuildContext context, String verifycode) async {
    if (verifycode.isEmpty) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        title: 'Error',
        desc: 'Please enter the verification code.',
        btnOkOnPress: () {},
      ).show();
      update();
    }

    statusRequest = StatusRequest.loading;
    update();

    var response = await otpSignupData.postData(email!, verifycode);
    // print("Response: $response");

    // Check if the response is valid and handle errors
    if (response['status'] == 'success') {
      AwesomeDialog(
        dismissOnTouchOutside: false,
        context: context,
        dialogType: DialogType.success,
        title: 'Success',
        desc: 'You have successfully created an account!',
        btnOkOnPress: () {
          Get.offAllNamed(AppRoutes.login);
        },
        btnOkColor: const Color(0xffa600ff),
        btnOkText: "Login",
      ).show();
    } else {
      AwesomeDialog(
        dismissOnTouchOutside: false,
        context: context,
        dialogType: DialogType.error,
        title: 'Error',
        desc: response['message'] ?? 'Unknown error',
        btnCancelOnPress: () {},
      ).show();
    }
  }
}
