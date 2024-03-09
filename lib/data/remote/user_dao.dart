

import 'package:firebase_auth/firebase_auth.dart';

class UserDao {

  Future<void> updatePassword(User user,String newPassword) async {
    await user.updatePassword(newPassword);
  }

  Future<void> deleteAccount(User user) async {
    await user.delete();
  }

}