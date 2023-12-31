
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../pages/settings_pages/settings_page.dart';
import '../../provider/shared_prefrence_provider.dart';

void showColorPalette(BuildContext context,WidgetRef ref) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 200, // モーダルの高さ
        child: GridView.count(
          crossAxisCount: 5, // 1行あたりの色の数
          children: paletteColors.map((color) {
            return InkWell(
              onTap: () async{

                Navigator.pop(context);

                ref.read(colorSharedPreferencesProvider).setInt("color", color.value);

                ref.watch(colorProvider.notifier).update((state) => ref.watch(colorSharedPreferencesProvider).getInt("color")!);

              },
              child: Container(
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
            );
          }).toList(),
        ),
      );
    },
  );
}



final List<Color> paletteColors = [
  Colors.red,
  Colors.green,
  Colors.cyan,
  Colors.orange,
  Colors.purple,
  // 他の色
];