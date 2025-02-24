class AppLinks {
  static const String ServerLink = "http://anasbayoumy20.helioho.st/primeshop";
  // static const String ServerLink = "http://localhost/primeshop";

//==============================images==========================
  static const String image =
      "http://anasbayoumy20.helioho.st/primeshop/upload";

//=============================
  static const String imagecategories = "$image/categories";

  // Test
  static const String test = "$ServerLink/test.php";

  // Auth
  static const String Signup = "$ServerLink/auth/signup.php";
  static const String login = "$ServerLink/auth/login.php";
  static const String verifyotp = "$ServerLink/auth/verifycode.php";

  //forgetpassword
  static const String checkemail = "$ServerLink/forgetpassword/checkemail.php";
  static const String resetpassword =
      "$ServerLink/forgetpassword/resetpassword.php";
  static const String verifycode = "$ServerLink/forgetpassword/verifycode.php";

  //home
  static const String homepage = "$ServerLink/home.php";
}
