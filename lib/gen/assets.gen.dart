/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsGuideAnswerGen {
  const $AssetsGuideAnswerGen();

  /// File path: assets/guide_answer/answer.png
  AssetGenImage get answer =>
      const AssetGenImage('assets/guide_answer/answer.png');

  /// File path: assets/guide_answer/grade.png
  AssetGenImage get grade =>
      const AssetGenImage('assets/guide_answer/grade.png');

  /// File path: assets/guide_answer/input_pass.png
  AssetGenImage get inputPass =>
      const AssetGenImage('assets/guide_answer/input_pass.png');

  /// File path: assets/guide_answer/library.png
  AssetGenImage get library =>
      const AssetGenImage('assets/guide_answer/library.png');

  /// List of all assets
  List<AssetGenImage> get values => [answer, grade, inputPass, library];
}

class $AssetsGuideMakeGen {
  const $AssetsGuideMakeGen();

  /// File path: assets/guide_make/confirm.png
  AssetGenImage get confirm =>
      const AssetGenImage('assets/guide_make/confirm.png');

  /// File path: assets/guide_make/home.png
  AssetGenImage get home => const AssetGenImage('assets/guide_make/home.png');

  /// File path: assets/guide_make/initial.png
  AssetGenImage get initial =>
      const AssetGenImage('assets/guide_make/initial.png');

  /// File path: assets/guide_make/make_free.png
  AssetGenImage get makeFree =>
      const AssetGenImage('assets/guide_make/make_free.png');

  /// File path: assets/guide_make/optional1.png
  AssetGenImage get optional1 =>
      const AssetGenImage('assets/guide_make/optional1.png');

  /// File path: assets/guide_make/optional2.png
  AssetGenImage get optional2 =>
      const AssetGenImage('assets/guide_make/optional2.png');

  /// File path: assets/guide_make/share.png
  AssetGenImage get share => const AssetGenImage('assets/guide_make/share.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [confirm, home, initial, makeFree, optional1, optional2, share];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/icon.png
  AssetGenImage get icon => const AssetGenImage('assets/images/icon.png');

  /// File path: assets/images/screen.png
  AssetGenImage get screen => const AssetGenImage('assets/images/screen.png');

  /// File path: assets/images/share.png
  AssetGenImage get share => const AssetGenImage('assets/images/share.png');

  /// List of all assets
  List<AssetGenImage> get values => [icon, screen, share];
}

class Assets {
  Assets._();

  static const $AssetsGuideAnswerGen guideAnswer = $AssetsGuideAnswerGen();
  static const $AssetsGuideMakeGen guideMake = $AssetsGuideMakeGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
