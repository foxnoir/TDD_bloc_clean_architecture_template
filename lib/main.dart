import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:tdd_clean_architecture/core/di/di.dart';
import 'package:tdd_clean_architecture/core/log/logger.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _loadApp();
  }, (Object error, StackTrace stack) {
    logger.info('zone error $error');
  });
}

Future<void> _loadApp() async {
  try {
    await DI.getIt.reset();
    await configureInjection(Environment.dev);
    runApp(TemplateApp());
  } catch (ex, st) {
    logger.error('startup exception', error: ex, stackTrace: st);
  }
}

class TemplateApp extends StatelessWidget {
  factory TemplateApp() => instance;
  const TemplateApp._internal();

  static const TemplateApp instance = TemplateApp._internal();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('TDD and clean architecture'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'hello there',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
