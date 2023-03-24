import 'dart:developer';
import 'package:hive/hive.dart';
import 'package:ic_creame_app/core/constants/static_constants.dart';

class LocalStorageHive {
  static storeToken(String? token) async {
    var box = Hive.openBox('tokenBox');
    final databox = await box;
    databox.put("token", token);
  }

  static Future<String?> getStoredToken() async {
    var box = Hive.openBox('tokenBox');
    final databox = await box;
    if (databox.get("token") != null) {
      final authToken = databox.get("token");
      log(authToken, name: "token :");
      return Constants.authToken = await authToken;
    }
    return null;
  }
}
