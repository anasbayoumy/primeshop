import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primeshop/controller/forgetpassword/forgetPassword_controller.dart';
import 'package:primeshop/core/class/handledataview.dart';
import 'package:primeshop/core/constants/imageasset.dart';
import 'package:primeshop/core/functions/validinput.dart';
import 'package:primeshop/view/widgets/auth/custombuttonauth.dart';
import 'package:primeshop/view/widgets/auth/customtextfieldnorm.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetpasswordControllerImp controller =
        Get.put(ForgetpasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: SizedBox(
            height: 200, // Adjusted height for better fit
            width: 200, // Adjusted width for better fit
            child: FittedBox(
              fit: BoxFit.contain,
              child: Image.asset(
                imageAsset.logo,
              ),
            ),
          ),
        ),
        body: GetBuilder<ForgetpasswordControllerImp>(
          builder: (controller) => HandledataviewRequest(
              statusRequest: controller.statusRequest,
              widget: Form(
                key: controller.formState,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Center(
                        child: Text(
                          "Forget Password",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 37, 37, 37),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomtextfieldNorm(
                        isNumber: false,
                        valid: (val) {
                          return ValidInput(val!, 2, 100, "email");
                        },
                        myController: controller.email,
                        prefixIcon: const Icon(Icons.email_outlined),
                        hint: "Enter your Email",
                      ),
                      const SizedBox(height: 40),
                      CustomButtonAuth(
                        childText: 'Check',
                        onPressed: () {
                          if (controller.formState.currentState!.validate()) {
                            controller.CheckPass(context);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }
}
