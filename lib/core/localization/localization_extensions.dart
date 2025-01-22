import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Default fallback strings
class FallbackStrings {
  static const fetchingUsers = 'Fetching users';
  static const creatingUser = 'Creating user';
  static const addUser = 'Add user';
  static const pageNotFound = 'Page not found';
}

/// Extension on AppLocalizations to provide fallback strings
extension AppLocalizationsWithFallback on AppLocalizations? {
  String get fetchingUsers => FallbackStrings.fetchingUsers;

  String get creatingUser => FallbackStrings.creatingUser;

  String get addUser => FallbackStrings.addUser;

  String get pageNotFound => FallbackStrings.pageNotFound;
}
