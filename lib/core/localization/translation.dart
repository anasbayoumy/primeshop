import 'package:get/get.dart';

class MyTrans extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'hello': 'Hello',
          'welcome': 'Welcome to PrimeShop!',
          'login': 'Login',
          // Add more English translations here
        },
        'ar': {
          'hello': 'مرحبا',
          'welcome': 'أهلاً بك في PrimeShop!',
          'login': 'تسجيل الدخول',
          // Add more Arabic translations here
        },
      };
}
