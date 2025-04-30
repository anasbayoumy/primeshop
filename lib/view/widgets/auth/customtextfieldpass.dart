// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:primeshop/controller/auth/login_controller.dart';

// class CustomtextfieldPass extends StatelessWidget {
//   final String hint;
//   final TextEditingController myController;
//   final String? Function(String?) valid;

//   const CustomtextfieldPass({
//     super.key,
//     required this.hint,
//     required this.myController,
//     required this.valid,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // Get the instance of the controller
//     final controller = Get.find<LoginControllerImp>();

//     return Obx(() => TextFormField(
//           controller: myController,
//           validator: valid,
//           decoration: InputDecoration(
//             prefixIcon: const Icon(Icons.key_outlined),
//             suffixIcon: IconButton(
//               icon: Icon(
//                 controller.isPasswordVisible.value
//                     ? Icons.visibility
//                     : Icons.visibility_off,
//               ),
//               onPressed: () {
//                 // Call the toggle function from the controller
//                 controller.togglePasswordVisibility();
//               },
//             ),
//             hintText: hint,
//             contentPadding:
//                 const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(13),
//             ),
//           ),
//           obscureText:
//               !controller.isPasswordVisible.value, // Show or hide the password
//         ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:primeshop/view/widgets/auth/custombuttonauth.dart';
import 'package:primeshop/view/widgets/auth/customtextfieldnorm.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final ValueNotifier<bool> isPasswordVisible = ValueNotifier(false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            CustomtextfieldNorm(
              hint: 'Email',
              prefixIcon: const Icon(Icons.email),
              myController: emailController,
              valid: (value) => null,
              isNumber: false,
              isEmail: true,
              isPassword: false,
              suffixIcon: null,
              obscureText: null,
            ),
            const SizedBox(height: 16),
            ValueListenableBuilder<bool>(
              valueListenable: isPasswordVisible,
              builder: (context, value, child) {
                return CustomtextfieldNorm(
                  hint: 'Password',
                  prefixIcon: const Icon(Icons.key_outlined),
                  myController: passwordController,
                  valid: (value) => null,
                  isNumber: false,
                  isEmail: false,
                  isPassword: true,
                  suffixIcon: IconButton(
                    onPressed: () {
                      isPasswordVisible.value = !isPasswordVisible.value;
                    },
                    icon: Icon(
                      value ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  obscureText: !value,
                );
              },
            ),
            const SizedBox(height: 20),
            CustomButtonAuth(
              onPressed: () {
                // Handle login logic here
              },
              childText: 'Login',
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Navigate to the registration page
              },
              child: const Text('Don\'t have an account? Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}
