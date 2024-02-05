
abstract class AbstractAppSecureStorage {

  Future<String?> getUserPassword(String userEmail);
  Future<void> setUserPassword(String userEmail, String password);

}