import 'package:get/get.dart';

ValidInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "The form can't be empty";
  }

  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "Not valid username";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Not valid email";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Not valid phone number";
    }
  }
  if (val.length < min) {
    return "The input must be more than $min";
  }
  if (val.length > max) {
    return "The input must be less then $max";
  }
}
