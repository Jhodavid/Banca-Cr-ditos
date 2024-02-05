import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:banca_creditos/domain/services/abstract_app_secure_storage.dart';



class AppSecureStorage extends AbstractAppSecureStorage {

  static const _storage = FlutterSecureStorage();

  @override
  Future<String?> getUserPassword(String userEmail) async {
    return await _storage.read(key: userEmail);
  }

  @override
  Future<void> setUserPassword(String userEmail, String password) async {
    await _storage.write(key: userEmail, value: password);
  }

}