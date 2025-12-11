abstract interface class AuthRepository {
  Future<void> signInUser(String email, String password);
  Future<void> signUpUser(
    String email,
    String password,
    String fullName,
    String phoneNumber,
  );
  Future<void> resetPassword(String email);
  Future<void> signOut();
}
