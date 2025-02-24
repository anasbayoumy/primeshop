import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primeshop/core/class/statusrequest.dart';
import 'package:primeshop/core/constants/routes.dart';
import 'package:primeshop/core/functions/handlingdata.dart';
import 'package:primeshop/data/datasource/remote/forgetpassword/resetpassword.dart';

abstract class ResetpasswordController extends GetxController {
  void ResetPass(BuildContext context);
  void goToLogin(BuildContext context);
}

class ResetpasswordControllerImp extends ResetpasswordController {
  var isPasswordVisible = true.obs;

  ResetpasswordData resetpasswordData = ResetpasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController password;
  late TextEditingController rePassword;
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  String? email;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value; // Toggle the value
  }

  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();
    email = Get.arguments?['email'] ?? ''; // Null safety
    print("Received email: $email"); // Debug print
    super.onInit();
  }

  @override
  void ResetPass(BuildContext context) async {
    if (password.text != rePassword.text) {
      return AwesomeDialog(
        dismissOnTouchOutside: false,
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Error',
        desc: 'Passwords do not match',
        descTextStyle:
            const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        btnOkOnPress: () {},
        btnOkColor: const Color(0xffa600ff),
        btnOkText: "Retry",
      ).show();
    }

    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await resetpasswordData.postData(email!, password.text);
      print("Response: $response");

      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          AwesomeDialog(
            dismissOnTouchOutside: false,
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'Success',
            desc: 'You have Updated your password',
            descTextStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
            animType: AnimType.rightSlide,
            title: 'Error',
            desc: response['message'] ?? 'Something went wrong',
            descTextStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            btnOkOnPress: () {},
            btnOkColor: const Color(0xffa600ff),
            btnOkText: "Retry",
          ).show();
        }
      } else {
        print("Request failed, status: $statusRequest");
      }
      update();
    } else {
      print("Form is not valid");
    }
  }

  @override
  goToLogin(BuildContext context) {
    AwesomeDialog(
      dismissOnTouchOutside: false,
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: 'Success',
      desc: 'You have successfully renewed your password!',
      descTextStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      btnOkOnPress: () {
        Get.offAllNamed(AppRoutes.login);
      },
      btnOkColor: const Color(0xffa600ff),
      btnOkText: "Login",
    ).show();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }
}
