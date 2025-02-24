import 'package:primeshop/core/class/crud.dart';
import 'package:primeshop/linkapi.dart';

class loginData {
  Crud crud = Crud();

  loginData(this.crud);

  postData(String email, String password) async {
    var response = await crud.postRequest(AppLinks.login, {
      "password": password,
      "email": email,
    });
    print("API response: $response");
    return response.fold((l) => l, (r) => r);
  }
}
