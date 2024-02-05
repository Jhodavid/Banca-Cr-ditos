import 'package:isar/isar.dart';
import 'package:flutter/foundation.dart';

import 'package:banca_creditos/config/isar_db.dart';
import 'package:banca_creditos/domain/entities/user_entity.dart';
import 'package:banca_creditos/infraestruture/services/app_secure_storage.dart';
import 'package:banca_creditos/domain/datasources/abstract_user_datasource.dart';



class IsarAndSecureStorageLocalUserDatasourceImpl extends AbstractUserDatasource {

  @override
  Future<UserEntity?> singIn(String email, String password) async {
    try {
      final isar = await IsarDB.openDB();
      final user = await isar.userEntitys.filter().emailEqualTo(email).findFirst();

      final userPassword = await AppSecureStorage().getUserPassword(email);
      if(userPassword == password) {
        return user;
      }
    } on StateError {
      if(kDebugMode) print('Error in Isar singIn');
    }
    return null;
  }

  @override
  Future<void> singUp(UserEntity user, String password) async {
    final isar = await IsarDB.openDB();
    await AppSecureStorage().setUserPassword(user.email, password);
    await isar.writeTxn(() async => { await isar.userEntitys.put(user)});
  }

}