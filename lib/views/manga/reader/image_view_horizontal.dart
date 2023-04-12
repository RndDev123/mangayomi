import 'dart:io';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:mangayomi/utils/headers.dart';

class ImageViewHorizontal extends StatefulWidget {
  final int length;
  final String url;
  final int index;
  final String titleManga;
  final String source;
  final String chapter;
  final Directory path;
  final Widget? Function(ExtendedImageState state) loadStateChanged;
  final Function(ExtendedImageGestureState state) onDoubleTap;
  final GestureConfig Function(ExtendedImageState state)
      initGestureConfigHandler;
  const ImageViewHorizontal({
    super.key,
    required this.url,
    required this.chapter,
    required this.index,
    required this.path,
    required this.titleManga,
    required this.source,
    required this.length,
    required this.loadStateChanged,
    required this.onDoubleTap,
    required this.initGestureConfigHandler,
  });

  @override
  State createState() => _ImageViewHorizontalState();
}

typedef DoubleClickAnimationListener = void Function();

class _ImageViewHorizontalState extends State<ImageViewHorizontal> {
  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      widget.url,
      cache: true,
      clearMemoryCacheWhenDispose: true,
      enableMemoryCache: false,
      cacheMaxAge: const Duration(days: 7),
      headers: headers(widget.source),
      mode: ExtendedImageMode.gesture,
      initGestureConfigHandler: widget.initGestureConfigHandler,
      onDoubleTap: widget.onDoubleTap,
      handleLoadingProgress: true,
      loadStateChanged: widget.loadStateChanged,
    );
  }
}
