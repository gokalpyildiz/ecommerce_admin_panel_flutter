import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

@immutable
final class TranslationManager extends EasyLocalization {
  TranslationManager({
    required super.child,
    super.key,
  }) : super(
          path: _assetPath,
          supportedLocales: LocaleItems.supportedLocalize,
          startLocale: LocaleItems.tr.item,
        );
  static const String _assetPath = 'assets/translations';
}

enum LocaleItems {
  tr(Locale('tr', 'TR')),
  az(Locale('az', 'AZ'));

  static final List<Locale> supportedLocalize = <Locale>[
    az.item,
    tr.item,
  ];

  final Locale item;
  const LocaleItems(this.item);
}
