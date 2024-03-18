class BillingConst {
  static const String result = 'result';
  static const SUCCESS = 0; // 成功 (期限内)
  static const EXPIRED = 1; // 期限切れ
  static const DOCUMENT_NOT_FOUND = 2; // Firestoreにドキュメントなし
  static const NO_AUTH = 3; // 認証情報なし
  static const INVALID_RECEIPT = 4; // レシート情報が不正です
  static const ALREADY_EXIST = 5; // 同じトランザクションが存在している
  static const UNEXPECTED_ERROR = 99; // 不明なエラー
}