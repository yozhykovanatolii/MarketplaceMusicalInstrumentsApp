import 'package:firebase_auth/firebase_auth.dart';
import 'package:marketplace_musical_instruments_app/core/exception/auth/login_exception.dart';
import 'package:marketplace_musical_instruments_app/core/exception/auth/register_exception.dart';
import 'package:marketplace_musical_instruments_app/core/exception/auth/reset_password_exception.dart';
import 'package:marketplace_musical_instruments_app/core/exception/auth/user_not_found_exception.dart';

class UserAuthService {
  static final _firebaseAuth = FirebaseAuth.instance;

  static Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (exception) {
      throw LoginException.convertFromCode(exception.code);
    } catch (_) {
      throw LoginException();
    }
  }

  static Future<String> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    String userID = '';
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      userID = credential.user!.uid;
    } on FirebaseAuthException catch (exception) {
      throw RegisterException(exception.code);
    } catch (_) {
      throw RegisterException();
    }
    return userID;
  }

  static Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (exception) {
      throw ResetPasswordException(exception.code);
    } catch (_) {
      throw ResetPasswordException();
    }
  }

  static String get userId {
    final currentUser = _firebaseAuth.currentUser;
    if (currentUser == null) throw UserNotFoundException('User didn\'t find');
    return currentUser.uid;
  }

  static Stream<User?> get user => _firebaseAuth.authStateChanges();

  static Future<void> signOut() async => _firebaseAuth.signOut();
}
