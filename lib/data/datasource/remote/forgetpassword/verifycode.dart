import 'package:primeshop/core/class/crud.dart';
import 'package:primeshop/linkapi.dart';

class VerifycodeData {
  Crud crud = Crud();

  VerifycodeData(this.crud);

  postData(String email, String verifycode) async {
    var response = await crud.postRequest(AppLinks.verifycode, {
      "verifycode": verifycode,
      "email": email,
    });
    print("API response: $response");
    return response.fold((l) => l, (r) => r);
  }
}
