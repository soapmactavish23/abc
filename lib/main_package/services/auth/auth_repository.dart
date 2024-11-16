mixin AuthRepository {
  Future<void> login(String email, String password);

  Future<void> signOut();
}
