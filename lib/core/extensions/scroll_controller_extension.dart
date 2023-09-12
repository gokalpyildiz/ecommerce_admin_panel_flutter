import 'package:flutter/material.dart';

extension ScrollControllerExtensions on ScrollController {
  void onScrollEndsListener(
    void Function() callback, {
    double offset = 0,
    bool isStorePageScrollLoading = false,
    int page = 0,
  }) {
    addListener(() {
      final maxScroll = position.maxScrollExtent;
      final currentScroll = position.pixels - offset;

      if (currentScroll == maxScroll &&
          page != -1 &&
          !isStorePageScrollLoading) {
        callback();
      }
    });
  }
}
