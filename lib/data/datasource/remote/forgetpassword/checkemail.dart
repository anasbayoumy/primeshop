import 'package:primeshop/core/class/crud.dart';
import 'package:primeshop/linkapi.dart';

class CheckemailData {
  Crud crud = Crud();

  CheckemailData(this.crud);

  postData(String email) async {
    var response = await crud.postRequest(AppLinks.checkemail, {
      "email": email,
    });
    print("API response: $response");
    return response.fold((l) => l, (r) => r);
  }
}
