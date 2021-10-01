/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  String get estedadBlack => 'assets/fonts/Estedad-Black.ttf';
  String get estedadBold => 'assets/fonts/Estedad-Bold.ttf';
  String get estedadFDBlack => 'assets/fonts/Estedad-FD-Black.ttf';
  String get estedadFDBold => 'assets/fonts/Estedad-FD-Bold.ttf';
  String get estedadFDLight => 'assets/fonts/Estedad-FD-Light.ttf';
  String get estedadFDMedium => 'assets/fonts/Estedad-FD-Medium.ttf';
  String get estedadFDThin => 'assets/fonts/Estedad-FD-Thin.ttf';
  String get estedadLight => 'assets/fonts/Estedad-Light.ttf';
  String get estedadMedium => 'assets/fonts/Estedad-Medium.ttf';
  String get estedadThin => 'assets/fonts/Estedad-Thin.ttf';
  String get mehrganIcons => 'assets/fonts/MehrganIcons.ttf';
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
