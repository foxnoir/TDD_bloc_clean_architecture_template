import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FallbackLocalizations {
  factory FallbackLocalizations() {
    return _instance;
  }

  FallbackLocalizations._internal();
  static final FallbackLocalizations _instance =
      FallbackLocalizations._internal();

  String get hello => 'Hello';
}

extension AppLocalizationsWithFallback on AppLocalizations? {
  FallbackLocalizations get fallback => FallbackLocalizations();

  String get hello => this?.hello ?? fallback.hello;
}
