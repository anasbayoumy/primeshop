import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primeshop/controller/auth/login_controller.dart';
import 'package:primeshop/controller/auth/signUp_controller.dart';
import 'package:primeshop/core/class/handledataview.dart';
import 'package:primeshop/core/functions/validinput.dart';
import 'package:primeshop/view/widgets/auth/custombuttonauth.dart';
import 'package:primeshop/view/widgets/auth/customtextfieldnorm.dart';
import 'package:primeshop/view/widgets/auth/customtextfieldpass.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    Get.put(LoginControllerImp());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: 200,
          width: 200,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Image.asset("assets/images/Logo-removebg-preview.png"),
          ),
        ),
      ),
      body: GetBuilder<SignUpControllerImp>(
        builder: (controller) => HandledataviewRequest(
          statusRequest: controller.statusRequest,
          widget: Form(
            key: controller.formState,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "SignUp",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Englishone",
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF252525),
                    ),
                  ),
                  const SizedBox(height: 50),
                  CustomtextfieldNorm(
                    isNumber: false,
                    valid: (val) => ValidInput(val!, 2, 100, "username"),
                    myController: controller.username,
                    prefixIcon: const Icon(Icons.person_2_outlined),
                    hint: "Enter your Full Name",
                  ),
                  const SizedBox(height: 20),
                  CustomtextfieldNorm(
                    isNumber: false,
                    valid: (val) => ValidInput(val!, 2, 100, "email"),
                    myController: controller.email,
                    prefixIcon: const Icon(Icons.email_outlined),
                    hint: "Enter your Email",
                  ),
                  const SizedBox(height: 20),
                  CustomtextfieldNorm(
                    isNumber: true,
                    valid: (val) => ValidInput(val!, 11, 11, "phone"),
                    myController: controller.phone,
                    prefixIcon: const Icon(Icons.phone),
                    hint: "Enter your Phone Number",
                  ),
                  const SizedBox(height: 20),
                  CustomtextfieldPass(
                    valid: (val) => ValidInput(val!, 8, 50, "password"),
                    myController: controller.password,
                    hint: "Enter your Password",
                  ),
                  const SizedBox(height: 40),
                  CustomButtonAuth(
                    childText: 'SignUp',
                    onPressed: () => controller.createAccount(context),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Or Login with"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          // Facebook login logic here
                        },
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset(
                              "assets/images/icons8-facebook-50.png"),
                        ),
                      ),
                      const Text("  |  "),
                      InkWell(
                        onTap: () {
                          // Google login logic here
                        },
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child:
                              Image.asset("assets/images/icons8-google-50.png"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: controller.goToLogin,
                        child: const Text(
                          "Login",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
