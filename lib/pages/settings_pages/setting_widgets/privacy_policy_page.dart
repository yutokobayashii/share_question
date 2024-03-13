import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class PrivacyPolicyPage extends HookConsumerWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                size: 28,
              )),
          title: const Text('プライバシーポリシー'),
        ),
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(18),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text('''1. 総則\n
「Qシェア」（以下、「本アプリ」といいます。）は、本アプリの提供するサービス（以下、「本サービス」といいます。）を安全にご利用いただくため、ユーザーのプライバシーを尊重し、個人情報の保護に努めます。

2. 収集する情報\n
本アプリは、個人を特定する情報（氏名、メールアドレス、電話番号など）の収集は行いません。ただし、以下の情報の収集があり得ます。

本サービスの利用状況（アクセスログ、利用した機能など）
問題作成や回答の内容（個人を特定しない範囲で）
デバイス情報（OS種類、ブラウザ種類など）

3. 情報収集の目的\n
収集した情報は、以下の目的で利用されます。

本サービスの品質向上、新機能の開発
ユーザーサポート、問い合わせ対応
システムのトラブルシューティング
使用状況の分析によるマーケティング戦略の策定

4. 情報の共有と開示\n
本アプリは、ユーザーの同意なくして、第三者に個人情報を共有または開示しません。ただし、法的要求に基づく場合や、ユーザーの安全を守るために必要と判断される場合には、この限りではありません。

5. 情報の保護\n
本アプリは、収集した情報の安全性確保のため、適切な物理的、技術的、管理的対策を講じます。また、情報の不正アクセス、紛失、破壊、改ざん、漏洩から保護するための努力をします。

6. ユーザーの権利\n
ユーザーは、自身に関する情報の確認、修正、削除を要求する権利を有します。本アプリは、合理的な範囲でこれらの要求に応じます。

7. プライバシーポリシーの変更\n
本アプリは、プライバシーポリシーを随時更新することがあります。重要な変更があった場合は、本アプリまたは本サービス上で通知します。

8. お問い合わせ\n
本プライバシーポリシーに関するご質問や懸念がある場合は、本アプリのカスタマーサポートまでお問い合わせください。


                  ''')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
