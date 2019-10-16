import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:user_repository/auth_repo.dart';


class FireBaseAuthRepo implements AuthRepo {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FireBaseAuthRepo ({FirebaseAuth firebaseAuth, GoogleSignIn googleSignin})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
      _googleSignIn = googleSignin ?? GoogleSignIn();

  Future<FirebaseUser> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _firebaseAuth.signInWithCredential(credential);
    return _firebaseAuth.currentUser();
  }

  Future<bool> isAuthenticated() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  Future<void> authenticate() {
    return _firebaseAuth.signInAnonymously();
  }

  Future<String> getUserId() async {
    return (await _firebaseAuth.currentUser()).uid;
  }
}