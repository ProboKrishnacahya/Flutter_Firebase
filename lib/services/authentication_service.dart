part of 'services.dart';

class AuthenticationService {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static Future<UserCredential> signInWithGoogle() async {
    Firebase.initializeApp();

    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future signOut() async {
    Firebase.initializeApp();
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut().then((value) {});
  }
}
