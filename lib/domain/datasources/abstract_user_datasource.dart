import 'package:banca_creditos/domain/entities/user_entity.dart';



abstract class AbstractUserDatasource {

  Future<UserEntity?> singIn(String email, String password);
  Future<void> singUp(UserEntity user, String password);

}