import 'package:get/get.dart';
import 'package:primeshop/core/class/crud.dart';

class Initialbinding extends Bindings {
  @override
  void dependencies() {
    return Get.put(Crud());
  }
}
