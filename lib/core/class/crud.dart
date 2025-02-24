import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:primeshop/core/class/statusrequest.dart';
import 'package:http/http.dart' as http;
import 'package:primeshop/core/functions/checkinternet.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postRequest(String url, Map data) async {
    try {
      // Check for internet connectivity
      if (await checkInternet() == true) {
        var response = await http.post(
          Uri.parse(url),
          body: data,
        );

        print("Response Status Code: ${response.statusCode}");

        if (response.statusCode == 200 || response.statusCode == 201) {
          // Parse the response body as JSON
          Map responseBody = jsonDecode(response.body);
          // print(responseBody);
          return Right(responseBody);
        } else {
          print("Server failed with status: ${response.statusCode}");
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        print("Offline failure");
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (e) {
      print("Exception caught: $e");
      return const Left(StatusRequest.serverException);
    }
  }
}

// class Crud {
//   Future<Either<StatusRequest, Map>> postRequest(String url, Map data) async {
//     try {
//       // Check for internet connectivity
//       if (await checkInternet() == true) {
//         var response = await http.post(
//           Uri.parse(url),
//           headers: {'Content-Type': 'application/json'}, // Set content type
//           body: jsonEncode(data), // Encode data as JSON
//         );

//         print("Response Status Code: ${response.statusCode}");
//         print("Response Body: ${response.body}"); // Log raw response

//         if (response.statusCode == 200 || response.statusCode == 201) {
//           // Parse the response body as JSON
//           Map responseBody = jsonDecode(response.body);
//           print(responseBody);
//           return Right(responseBody);
//         } else {
//           print("Server failed with status: ${response.statusCode}");
//           return const Left(StatusRequest.serverfailure);
//         }
//       } else {
//         print("Offline failure");
//         return const Left(StatusRequest.offlinefailure);
//       }
//     } catch (e) {
//       print("Exception caught: $e");
//       return const Left(StatusRequest.serverException);
//     }
//   }
// }
