import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:phatima/app/core/domain/error/exceptions.dart';

import '../models/logged_user_model.dart';
import 'auth_datasource.dart';

class AuthFirebaseImpl implements IAuthDataSource {
  final FirebaseAuth firebaseAuth;
  AuthFirebaseImpl({required this.firebaseAuth});

  @override
  Future<LoggedUserModel> getLoggedUser() async {
    final user = firebaseAuth.currentUser;

    if (user == null) throw LoggedUserException();

    return LoggedUserModel(
        uid: user.uid,
        displayName: user.displayName!,
        photoURL: user.photoURL!,
        email: user.email!,
        phone: user.phoneNumber,
        createdAt: user.metadata.creationTime!);
  }

  @override
  Future<LoggedUserModel> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) throw ServerException();

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential = await firebaseAuth.signInWithCredential(credential);
    final user = userCredential.user!;

    return LoggedUserModel(
        uid: user.uid,
        displayName: user.displayName!,
        photoURL: user.photoURL!,
        email: user.email!,
        phone: user.phoneNumber,
        createdAt: user.metadata.creationTime!);
  }

  @override
  Future<void> logout() async {
    return await firebaseAuth.signOut();
  }
}
