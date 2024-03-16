// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class Authservice {
//   signInwithGoogle() async {
//     //begin sign in
//     final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

//     //obtain auth details from request
//     final GoogleSignInAuthentication gAuth = await gUser!.authentication;

//     //create new credential for user
//     final credential = GoogleAuthProvider.credential(
//       accessToken: gAuth.accessToken,
//       idToken: gAuth.idToken,
//     );

//     //finaly signin
//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   }
// }
