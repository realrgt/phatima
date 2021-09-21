import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/entities/logged_user.dart';
import 'auth_datasource.dart';

class AuthFirebaseImpl implements IAuthDataSource {
  final FirebaseAuth firebaseAuth;
  AuthFirebaseImpl({required this.firebaseAuth});

  @override
  Future<LoggedUser> getLoggedUser() async {
    final user = firebaseAuth.currentUser;

    if (user == null) throw LoggedUserException();

    return LoggedUser(
        uid: user.uid,
        displayName: user.displayName!,
        photoURL: user.photoURL!,
        email: user.email!,
        phone: user.phoneNumber,
        createdAt: user.metadata.creationTime!);
  }

  @override
  Future<LoggedUser> loginWithGoogle() async {
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

    return LoggedUser(
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
