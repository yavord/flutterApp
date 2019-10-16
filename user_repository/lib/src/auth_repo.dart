abstract class AuthRepo {
  Future<bool> isAuthenticated();

  Future<void> authenticate();

  Future<String> getUserId();  
}