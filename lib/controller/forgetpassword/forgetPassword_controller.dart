import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:primeshop/core/class/statusrequest.dart';
import 'package:primeshop/core/constants/routes.dart';
import 'package:primeshop/core/functions/handlingdata.dart';
import 'package:primeshop/data/datasource/remote/forgetpassword/checkemail.dart';

abstract class ForgetpasswordController extends GetxController {
  // ignore: non_constant_identifier_names
  CheckPass(BuildContext context);
}

class ForgetpasswordControllerImp extends ForgetpasswordController {
  CheckemailData checkemailData = CheckemailData(Get.find());

  late TextEditingController email;
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  CheckPass(context) async {
    var formData = formState.currentState;
    if (formData != null && formData.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkemailData.postData(email.text);
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
          Get.offAllNamed(AppRoutes.Verify, arguments: {'email': email.text});
        } else {
          AwesomeDialog(
            dismissOnTouchOutside: false,
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Error',
            desc: response[
                'message'], // Display the error message from the server
            descTextStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            // btnCancelOnPress: () {},
            btnOkOnPress: () {},
            btnOkColor: const Color(0xffa600ff),
            btnOkText: "Retry",
          ).show();
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
    //else {
    //   print("Not Valid");
    // }
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
