import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:primeshop/core/class/statusrequest.dart';
import 'package:primeshop/core/constants/routes.dart';
import 'package:primeshop/core/functions/handlingdata.dart';
import 'package:primeshop/data/datasource/remote/auth/signup.dart';

abstract class SignupController extends GetxController {
  Future<void> createAccount(BuildContext context);
  void goToLogin();
}

class SignUpControllerImp extends SignupController {
  late TextEditingController username;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController password;
  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;
  SignupData signupData = SignupData(Get.find());

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    username = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    phone.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Future<void> createAccount(BuildContext context) async {
    var formData = formState.currentState;
    if (formData != null && formData.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await signupData.postData(
          username.text, email.text, password.text, phone.text);

      print("Response: $response");

      if (response is Map && response['status'] != null) {
        print("Response Status: ${response['status']}");
        print("Response Message: ${response['message']}");
      }

      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          Get.offAllNamed(AppRoutes.OtpSignup,
              arguments: {'email': email.text});
        } else {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Error',
            desc: response['message'],
            btnOkOnPress: () => Get.offAllNamed(AppRoutes.login),
            btnOkColor: const Color(0xffa600ff),
            btnOkText: "Login",
          ).show();
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("Form is not valid");
    }
  }

  @override
  void goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }
}
