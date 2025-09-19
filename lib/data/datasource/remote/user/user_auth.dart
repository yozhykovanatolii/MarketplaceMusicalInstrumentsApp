import 'package:firebase_auth/firebase_auth.dart';
import 'package:marketplace_musical_instruments_app/core/exception/login_exception.dart';
import 'package:marketplace_musical_instruments_app/core/exception/register_exception.dart';

class UserAuth {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithEmailAndPassword(
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

  Future<String> signUpWithEmailAndPassword(
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

  Stream<User?> get user => _firebaseAuth.authStateChanges();
}
