import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final storage = const FlutterSecureStorage();

  Future<bool> setValue({required String key, required String value}) async {
    await storage.write(key: key, value: value);
    return true;
  }

  Future<dynamic> getValue({required String key}) async {
    return storage.read(key: key);
  }

  Future<bool> delete({required String key}) async {
    await storage.delete(key: key);
    return true;
  }
}
