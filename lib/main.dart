import 'package:banca_creditos/presentation/providers/current_user_data_provider.dart';
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

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends ConsumerWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(currentUserDataProvider);

    return MaterialApp.router(
      scaffoldMessengerKey: scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      routerConfig: appRouter,
      theme: AppTheme().getTheme()
    );
  }
}