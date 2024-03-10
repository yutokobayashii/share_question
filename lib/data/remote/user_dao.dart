

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserDao {

  Future<void> updatePassword(User user,String newPassword) async {
    await user.updatePassword(newPassword);
  }

  Future<void> deleteAccount(User user) async {
    await user.delete();
  }

  Future<void> renewPassword(User user,String newPassword) async {
    await user.updatePassword(newPassword);
  }

  Future<bool> reAuthenticate(User user,String oldPassword) async {
    final cred = EmailAuthProvider.credential(email: user.email!, password: oldPassword);
    try {
      await user.reauthenticateWithCredential(cred);
      return true;
    } catch (error) {
      debugPrint(error.toString());
      return false;
    }
  }

}