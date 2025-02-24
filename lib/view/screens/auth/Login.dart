import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primeshop/controller/auth/login_controller.dart';
import 'package:primeshop/core/class/handledataview.dart';
import 'package:primeshop/core/functions/validinput.dart';
import 'package:primeshop/view/widgets/auth/custombuttonauth.dart';
import 'package:primeshop/view/widgets/auth/customtextfieldnorm.dart';
import 'package:primeshop/view/widgets/auth/customtextfieldpass.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: WillPopScope(
        onWillPop: () async => true,
        child: GetBuilder<LoginControllerImp>(
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
                        "Login",
                        style: TextStyle(
                          fontFamily: "Englishone",
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF252525),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 200,
                      child: Image.asset(
                        "assets/images/Login.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 40),
                    CustomtextfieldNorm(
                      isNumber: false,
                      valid: (val) => ValidInput(val!, 2, 100, "email"),
                      myController: controller.email,
                      prefixIcon: const Icon(Icons.email_outlined),
                      hint: "Enter your Email",
                    ),
                    const SizedBox(height: 20),
                    CustomtextfieldPass(
                      valid: (val) => ValidInput(val!, 8, 50, "password"),
                      myController: controller.password,
                      hint: "Enter your Password",
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: controller.goToForgetPassword,
                          child: const Text("Forgot Password?"),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    CustomButtonAuth(
                      childText: 'Login',
                      onPressed: () => controller.login(context),
                    ),
                    const SizedBox(height: 40),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Or Login with")],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: Image.asset(
                                "assets/images/icons8-facebook-50.png"),
                          ),
                        ),
                        const Text("  |  "),
                        InkWell(
                          onTap: () {},
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: Image.asset(
                                "assets/images/icons8-google-50.png"),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: controller.goToSignup,
                          child: const Text(
                            "SignUp",
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
      ),
    );
  }
}
