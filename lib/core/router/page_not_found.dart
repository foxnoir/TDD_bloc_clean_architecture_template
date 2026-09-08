import 'package:flutter/material.dart';
import 'package:tdd_clean_architecture/l10n/app_localizations.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).pageNotFound),
      ),
      body: const Placeholder(),
    );
  }
}
