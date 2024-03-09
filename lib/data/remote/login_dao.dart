import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../entity/create_account_result/create_account_result.dart';
import '../../enum/firebase_auth_error_code.dart';

class LoginDao {
  Future<CreateAccountResult> createAccount(String password, String email) async {
     FirebaseAuthErrorCode? errorCode;
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final result = CreateAccountResult(userCredential: userCredential,errorCode: errorCode);
      return result;
    } on FirebaseAuthException catch (e) {
      errorCode = FirebaseAuthErrorCode.fromString(e.code);

    } catch (e) {
      debugPrint(e.toString());
    }

    return CreateAccountResult(userCredential: null,errorCode: errorCode);
  }

  Future<UserCredential?> login(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
      return null;
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> sendResetPassWordMail (String email) async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email);
  }


  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

}
