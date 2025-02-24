import 'package:primeshop/core/class/crud.dart';
import 'package:primeshop/linkapi.dart';

class SignupData {
  Crud crud = Crud();

  SignupData(this.crud);

  postData(String username, String email, String password, String phone) async {
    var response = await crud.postRequest(AppLinks.Signup, {
      "username": username,
      "email": email,
      "password": password,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
