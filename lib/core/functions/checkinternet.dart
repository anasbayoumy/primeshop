import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> checkInternet() async {
  var result = await Connectivity().checkConnectivity();
  if (result == ConnectivityResult.none) {
    return false; // Offline
  }
  return true; // Online
}

// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'dart:io' as io; // For mobile platforms
// import 'package:connectivity_plus/connectivity_plus.dart'; // For connectivity checking
//
// Future<bool?> checkInternet() async {
//   // Web Platform
//   if (kIsWeb) {
//     try {
//       // Check if the browser is online (Web only)
//       return true; // Alternatively, use html.window.navigator.onLine, but don't import dart:html
//     } catch (e) {
//       print("Web internet check error: $e");
//       return false;
//     }
//   }
//
//   // Non-web platforms (mobile, desktop)
//   try {
//     var connectivityResult = await (Connectivity().checkConnectivity());
//     if (connectivityResult == ConnectivityResult.mobile ||
//         connectivityResult == ConnectivityResult.wifi) {
//       try {
//         // Ping a remote server (like google.com) to check internet connectivity
//         final result = await io.InternetAddress.lookup('google.com');
//         if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//           return true;
//         }
//       } catch (e) {
//         print("Error in InternetAddress lookup: $e");
//         return false;
//       }
//     }
//   } catch (e) {
//     print("Error in connectivity check: $e");
//     return false;
//   }
//   return false;
// }
