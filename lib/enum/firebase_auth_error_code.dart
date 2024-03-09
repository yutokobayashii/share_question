enum FirebaseAuthErrorCode {
  invalidEmail("invalid-email", 1001, "メールアドレスの形式が正しくありません。"),
  userDisabled("user-disabled", 1002, "このユーザーアカウントは無効です。"),
  userNotFound("user-not-found", 1003, "このメールアドレスのユーザーは見つかりませんでした。"),
  wrongPassword("wrong-password", 1004, "パスワードが間違っています。"),
  emailAlreadyInUse("email-already-in-use", 1005, "このメールアドレスは既に使用されています。"),
  operationNotAllowed("operation-not-allowed", 1006, "メールとパスワードによるアカウント登録が許可されていません。"),
  weakPassword("weak-password", 1007, "パスワードが簡単すぎます。"),
  tooManyRequests("too-many-requests", 1008, "リクエストが多すぎます。後ほど再試行してください。"),
  networkRequestFailed("network-request-failed", 1009, "ネットワークエラーが発生しました。再試行してください。"),
  unknown("unknown", 9999, "予期せぬエラーが発生しました。");

  final String code;
  final int id;
  final String message;

  const FirebaseAuthErrorCode(this.code, this.id, this.message);

  // Firebaseのエラーコード文字列からEnum値に変換
  static FirebaseAuthErrorCode fromString(String errorCode) {
    return FirebaseAuthErrorCode.values.firstWhere(
          (e) => e.code == errorCode,
      orElse: () => FirebaseAuthErrorCode.unknown,
    );
  }
}
