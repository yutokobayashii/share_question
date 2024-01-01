

import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';



class PrivacyPolicyPage extends HookConsumerWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
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
          title: const Text('プライバシーポリシー'),


        ),
        body: Container(
          color: Colors.white,
          child:  const Column(
            children: [
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}