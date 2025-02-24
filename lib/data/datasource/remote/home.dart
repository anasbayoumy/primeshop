import 'package:primeshop/core/class/crud.dart';
import 'package:primeshop/linkapi.dart';

class homeData {
  Crud crud = Crud();

  homeData(this.crud);

  getData() async {
    var response = await crud.postRequest(AppLinks.homepage, {});
    return response.fold((l) => l, (r) => r);
  }
}
