// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get fetchingUsers => 'Fetching users';

  @override
  String get creatingUser => 'Creating user';

  @override
  String get addUser => 'Add user';

  @override
  String get pageNotFound => 'Page not found';
}
