import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:primeshop/core/middleware/mymiddleware.dart';
import 'package:primeshop/view/screens/inapp/home.dart';
import 'package:primeshop/view/screens/auth/ForgetPassword.dart';
import 'package:primeshop/view/screens/auth/Login.dart';
import 'package:primeshop/core/constants/routes.dart';
import 'package:primeshop/view/screens/auth/SignUp.dart';
import 'package:primeshop/view/screens/auth/otpsignup.dart';
import 'package:primeshop/view/screens/auth/resetpass.dart';
import 'package:primeshop/view/screens/auth/verify.dart';
import 'package:primeshop/view/screens/lang.dart';
import 'package:primeshop/view/screens/onboarding.dart';
// import 'package:primeshop/test_view.dart';
// import 'package:primeshop/view/test_view.dart';

List<GetPage<dynamic>>? routes = [
  //First Page
  GetPage(name: "/", page: () => const Lang(), middlewares: [Mymiddleware()]),

  // GetPage(name: "/", page: () => const TestView()),

  //OnBoarding
  GetPage(name: AppRoutes.onBoarding, page: () => const OnBoarding()),

  //Auth
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.SignUp, page: () => const SignUp()),
  GetPage(name: AppRoutes.ForgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoutes.Verify, page: () => const Verify()),
  GetPage(name: AppRoutes.ResetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoutes.OtpSignup, page: () => const OtpSignup()),

  GetPage(name: AppRoutes.Home, page: () => const Home()),
];
