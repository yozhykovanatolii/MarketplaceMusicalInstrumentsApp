import 'package:marketplace_musical_instruments_app/data/datasource/remote/firebase_auth/user_auth.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/firestore/user_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/model/user_model.dart';
import 'package:marketplace_musical_instruments_app/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final UserFirestore userFirestore;
  final UserAuth userAuth;

  AuthRepositoryImpl(this.userFirestore, this.userAuth);

  @override
  Future<void> signInUser(String email, String password) async {
    await userAuth.signInWithEmailAndPassword(email, password);
  }

  @override
  Future<void> signUpUser(
    String email,
    String password,
    String fullName,
    String phoneNumber,
  ) async {
    final userID = await userAuth.signUpWithEmailAndPassword(
      email,
      password,
    );
    UserModel userModel = UserModel(
      id: userID,
      fullName: fullName,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
      about: '',
      avatar:
          'https://xwgraskemxbhjtgqrjxn.supabase.co/storage/v1/object/public/images/uploads/1758373217886',
      favouriteListingsId: [],
    );
    await userFirestore.saveUser(userModel);
  }

  @override
  Future<void> resetPassword(String email) async {
    return await userAuth.resetPassword(email);
  }

  @override
  Future<void> signOut() async => userAuth.signOut();
}
