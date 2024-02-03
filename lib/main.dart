import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:banca_creditos/config/app_theme.dart';
import 'package:banca_creditos/config/router/app_router.dart';
import 'package:banca_creditos/config/localization/app_localization.dart';



void main() async {
  runApp(
    const ProviderScope(
      child: MyApp()
    )
  );
}

class MyApp extends ConsumerWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      routerConfig: appRouter,
      theme: AppTheme().getTheme()
    );
  }
}