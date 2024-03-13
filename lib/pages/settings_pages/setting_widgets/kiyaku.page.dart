


import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';



class KiyakuPage extends HookConsumerWidget {
  const KiyakuPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

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
              )
          ),
          title: const Text('利用規約'),


        ),
        body: Container(
          padding: const EdgeInsets.all(18.0),
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child:  const SingleChildScrollView(
            child: Column(
              children: [
               Text('''1. 適用\n
本規約は、「Qシェア」（以下、「本アプリ」といいます。）の提供するサービス（以下、「本サービス」といいます。）の利用条件を定めるものです。利用者（以下、「ユーザー」といいます。）は、本規約に同意の上、本サービスを利用するものとします。

2. サービス内容\n
本アプリは、ユーザーが自ら問題を作成し、作成後に発行されるパスワードを介して、他のユーザーがその問題に挑戦できるクイズプラットフォームを提供します。ログインや個人情報の登録は不要ですが、ユーザーによって作成されたコンテンツは本アプリによって収集され、サービスの改善や新たな機能の開発に利用されることがあります。課金はサブスクリプションモデルに基づいています。

3. コンテンツの収集\n
本アプリは、ユーザーが作成した問題とその回答、コメントなどのコンテンツを収集します。これらの情報は匿名化され、本アプリの品質向上、新機能の開発、ユーザーエクスペリエンスの改善のために使用されることがあります。個人を特定する情報は含まれません。

4. プライバシー\n
本アプリは、個人情報を収集または利用いたしません。ただし、アプリの改善やユーザーサポートのため、利用状況の匿名データを収集することがあります。

5. 課金について\n
本アプリの利用はサブスクリプションモデルによる課金が適用されます。サービスの詳細な料金、支払い条件、解約方法については、本アプリ内の課金セクションをご確認ください。

6. 禁止事項\n
ユーザーは、以下の行為をしてはなりません。

第三者の知的財産権を侵害する問題の作成
不快感を与える、または不適切な内容の問題の作成
本サービスの運営を妨げる行為
その他、法律に違反する行為

7. 免責事項\n
本アプリの利用によるいかなる損害についても、本アプリ開発者は責任を負いません。
本アプリ開発者は、本サービスの内容の正確性、完全性、信頼性、有用性について保証しません。
本アプリ開発者は、サービスの中断、停止、終了、利用不能、またはアクセス遅延に関して、ユーザーまたは第三者が被った損害に対して責任を負いません。
サブスクリプション課金に関連する問題（支払いエラー、解約問題など）について、本アプリ開発者は責任を負いません。課金に関するサポートは、利用している支払いプラットフォーム（アプリストア等）によって提供されます。

8. 規約の変更\n
本アプリ開発者は、ユーザーに通知することなく、いつでも本規約の内容を変更することができるものとします。変更後の規約は、本アプリに掲載された時点で効力を発生します。

9. 同意\n
本アプリのダウンロードまたは利用を開始した時点で、ユーザーは本規約に同意したものとみなされます。


                   ''')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
