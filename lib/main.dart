import 'package:primeshop/core/services/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primeshop/core/class/crud.dart';
import 'package:primeshop/core/localization/langchange.dart';
import 'package:primeshop/core/localization/translation.dart';
import 'package:primeshop/intialbinding/initialbinding.dart';
import 'package:primeshop/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Ensure this is a function call
  await intialService();
  Get.put(Crud());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Langchange controller = Get.put(Langchange());

    return GetMaterialApp(
      translations: MyTrans(),
      locale: controller.language,
      debugShowCheckedModeBanner: false,
      title: "primeshop",
      getPages: routes,
      initialBinding: Initialbinding(),
    );
  }
}
