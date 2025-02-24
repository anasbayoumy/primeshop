import 'dart:html' as html;

Future<bool?> checkInternet() async {
  try {
    return html.window.navigator.onLine;
  } catch (e) {
    return false;
  }
}
