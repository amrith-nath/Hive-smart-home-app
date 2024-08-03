import 'dart:developer';

import 'package:hive/services/services.dart';

class SessionController {
  static final SessionController _session = SessionController._internal();

  SessionController._internal() {
    isLogin = false;
  }

  final SecureStorage storage = SecureStorage();

  String userEmail = '';
  String userName = '';
  bool? isLogin;

  factory SessionController() {
    return _session;
  }
  Future<void> deleteUserPreference() async {
    await storage.delete(key: 'userName');
    await storage.delete(key: 'email');
    await storage.delete(key: 'isLogin');
  }

  Future<void> saveUserInPreference(
      {required String userName, required String email}) async {
    storage.setValue(key: 'userName', value: userName);
    storage.setValue(key: 'email', value: email);
    storage.setValue(key: 'isLogin', value: "true");
  }

  Future<void> getUserDataFromPreference() async {
    try {
      var username = await storage.getValue(key: 'userName');
      var email = await storage.getValue(key: 'email');
      var isLogin = await storage.getValue(key: 'isLogin');

      if (username != null && email != null) {
        SessionController().userName = userName;
        SessionController().userEmail = email;
      }

      SessionController().isLogin = isLogin == 'true' ? true : false;
    } catch (e) {
      log(e.toString());
    }
  }
}
