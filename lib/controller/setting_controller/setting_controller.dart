import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/local/color_shared_preference_service.dart';

void showColorPalette(BuildContext context, WidgetRef ref) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 100.h, // モーダルの高さ
        child: GridView.count(
          crossAxisCount: 5, // 1行あたりの色の数
          children: paletteColors.map((color) {
            return InkWell(
              onTap: () async {
                Navigator.pop(context);

                ColorSharedPreferenceService().setColor(color.value);
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
