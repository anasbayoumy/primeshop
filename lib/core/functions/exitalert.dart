import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

void ExitAlert(bool shouldExit) {
  if (shouldExit) {
    AwesomeDialog(
      context: Get.context!,
      dialogType: DialogType.question,
      animType: AnimType.rightSlide,
      title: 'Succeed',
      desc: 'You have successfully renewed your password!',
      descTextStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      btnCancelOnPress: () {
        Get.back();
      },
      btnOkOnPress: () {
        exit(0);
      },
      btnOkColor: const Color(0xffa600ff),
      btnOkText: "Login",
    ).show();
  }
}
