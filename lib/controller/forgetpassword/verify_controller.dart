import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primeshop/core/class/statusrequest.dart';
import 'package:primeshop/core/constants/routes.dart';
import 'package:primeshop/data/datasource/remote/forgetpassword/verifycode.dart';

abstract class VerifyController extends GetxController {
  CheckOtp(BuildContext context, String verificationCode);
}

class VerifyControllerImp extends VerifyController {
  VerifycodeData verifycodeData = VerifycodeData(Get.find());

  late String verificationCode;
  StatusRequest statusRequest = StatusRequest.none;
  String? email;

  @override
  void onInit() {
    // Get the email passed from the previous screen or set it to an empty string if null
    email = Get.arguments?['email'] ?? '';

    super.onInit();
  }

  @override
  CheckOtp(BuildContext context, String verificationCode) async {
    // Start with loading state
    statusRequest = StatusRequest.loading;
    update();

    try {
      var response = await verifycodeData.postData(email!, verificationCode);

      // Handle success response
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRoutes.ResetPassword, arguments: {'email': email});
      } else {
        // Show error dialog in case of failure
        AwesomeDialog(
          dismissOnTouchOutside: false,
          context: context,
          dialogType: DialogType.error,
          title: 'Error',
          desc: response['message'] ?? 'Verification failed. Please try again.',
          btnCancelOnPress: () {},
        ).show();
      }
    } catch (e) {
      // Show an error dialog in case of an exception
      AwesomeDialog(
        dismissOnTouchOutside: false,
        context: context,
        dialogType: DialogType.error,
        title: 'Error',
        desc: 'An error occurred. Please check your connection and try again.',
        btnCancelOnPress: () {},
      ).show();
    } finally {
      // Reset statusRequest to update the UI after the process is completed
      statusRequest = StatusRequest.none;
      update();
    }
  }
}
