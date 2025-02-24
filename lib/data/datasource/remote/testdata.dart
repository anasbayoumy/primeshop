import 'package:primeshop/core/class/crud.dart';
import 'package:primeshop/linkapi.dart';

class Testdata {
  Crud crud = Crud();

  Testdata(this.crud);

  getData() async {
    var response = await crud.postRequest(AppLinks.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
