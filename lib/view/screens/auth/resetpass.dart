import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primeshop/controller/auth/login_controller.dart';
import 'package:primeshop/controller/forgetpassword/ResetPAssword_controller.dart';
import 'package:primeshop/core/class/handledataview.dart';
import 'package:primeshop/core/constants/imageasset.dart';
import 'package:primeshop/core/functions/validinput.dart';
import 'package:primeshop/view/widgets/auth/custombuttonauth.dart';
import 'package:primeshop/view/widgets/auth/customtextfieldpass.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final ResetpasswordControllerImp controller =
        Get.put(ResetpasswordControllerImp());
    Get.put(LoginControllerImp());

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: SizedBox(
            height: 200,
            width: 200,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Image.asset(
                imageAsset.logo,
              ),
            ),
          ),
        ),
        body: GetBuilder<ResetpasswordControllerImp>(
          builder: (controller) => HandledataviewRequest(
              statusRequest: controller.statusRequest,
              widget: Form(
                key: controller.formState,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: ListView(
                    children: [
                      const SizedBox(height: 20),
                      const Center(
                        child: Text(
                          "Reset Password",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 37, 37, 37),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      CustomtextfieldPass(
                        valid: (val) {
                          return ValidInput(val!, 8, 50, "password");
                        },
                        hint: 'Enter your new password',
                        myController: controller.password,
                      ),
                      const SizedBox(height: 20),
                      CustomtextfieldPass(
                        valid: (val) {
                          return ValidInput(val!, 8, 50, "password");
                        },
                        hint: 'Re-Enter your new password',
                        myController: controller.rePassword,
                      ),
                      const SizedBox(height: 60),
                      CustomButtonAuth(
                        childText: 'Reset Password',
                        onPressed: () {
                          controller.ResetPass(context);
                        },
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }
}
