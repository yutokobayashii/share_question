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

  Future<CreateAccountResult> login(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      final result = CreateAccountResult(userCredential: userCredential,errorCode: null);
      return result;
    } on FirebaseAuthException catch (e) {
      final result = CreateAccountResult(userCredential: null,errorCode: FirebaseAuthErrorCode.fromString(e.code));
      return result;
    }
  }

  Future<bool> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> sendResetPassWordMail (String email) async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email);
  }


  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Googleの認証フローをトリガー
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // ユーザーがGoogleサインインをキャンセルした場合
      if (googleUser == null) {
        return null;
      }

      // Googleサインインから認証の詳細を取得
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Firebase用の認証情報を作成
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Firebaseにユーザーをサインインし、UserCredentialを返却
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (error) {
      return null;
    }
  }


  Future<User?> getCurrentUser() async {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // ユーザーがログインしている場合、User型のオブジェクトを返します。
      return user;
    } else {
      // ユーザーがログインしていない場合、nullを返します。
      return null;
    }
  }


}
