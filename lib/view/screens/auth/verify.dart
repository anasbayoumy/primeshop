import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:primeshop/controller/forgetpassword/Verify_controller.dart';
import 'package:primeshop/core/class/handledataview.dart';

class Verify extends StatelessWidget {
  const Verify({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyControllerImp controller = Get.put(VerifyControllerImp());

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: SizedBox(
            height: 200, // Adjusted height for better fit
            width: 200, // Adjusted width for better fit
            child: FittedBox(
              fit: BoxFit.contain,
              child: Image.asset(
                "assets/images/Logo-removebg-preview.png", // Ensure the path is correct
              ),
            ),
          ),
        ),
        body: GetBuilder<VerifyControllerImp>(
          builder: (controller) => HandledataviewRequest(
              statusRequest: controller.statusRequest,
              widget: Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Column(
                          children: [
                            const Text(
                              "Verification",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 37, 37, 37),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                "Please write the OTP that was sent to : ${controller.email}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 82, 82, 82),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      OtpTextField(
                        fieldWidth: 50,
                        fieldHeight: 70,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        numberOfFields: 6,
                        borderColor: const Color(0xFF512DA8),
                        showFieldAsBox: true,
                        onCodeChanged: (String code) {},
                        onSubmit: (String verificationCode) {
                          controller.CheckOtp(context,
                              verificationCode); // Pass the OTP code here
                        },
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }
}
