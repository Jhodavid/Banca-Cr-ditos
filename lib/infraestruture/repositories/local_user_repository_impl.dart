import 'package:banca_creditos/domain/entities/user_entity.dart';
import 'package:banca_creditos/domain/datasources/abstract_user_datasource.dart';
import 'package:banca_creditos/domain/repositories/abstract_user_repository.dart';



class LocalUserRepositoryImpl extends AbstractUserRepository {

  final AbstractUserDatasource datasource;

  LocalUserRepositoryImpl(this.datasource);

  @override
  Future<UserEntity?> singIn(String email, String password) {
    return datasource.singIn(email, password);
  }

  @override
  Future<void> singUp(UserEntity user, String password) {
    return datasource.singUp(user, password);
  }

}