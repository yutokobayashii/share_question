
import 'package:firebase_auth/firebase_auth.dart';

import '../../enum/firebase_auth_error_code.dart';

class CreateAccountResult {
  final UserCredential? userCredential;
  final FirebaseAuthErrorCode? errorCode;

  CreateAccountResult({
    this.userCredential,
    this.errorCode});
}