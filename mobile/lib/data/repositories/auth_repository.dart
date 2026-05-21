import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance; 

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();
      
      final authorizedUser = await googleUser.authorizationClient
          .authorizeScopes(['email', 'profile']);

      final String? idToken = (googleUser.authentication).idToken;
      final String? accessToken = authorizedUser.accessToken;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: accessToken,
        idToken: idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      return userCredential.user;
    } catch (e) {
      print("Repository Yeni Google Login Hatası: $e");
      return null;
    }
  }
}