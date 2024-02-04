import 'package:flutter/material.dart';

import 'package:banca_creditos/config/localization/app_localization.dart';



class AppLogo extends StatelessWidget {

  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SizedBox(
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 35,
            height: 35,
            child: Image.asset('assets/logo.png')
          ),
          const SizedBox(width: 8),
          Text(
            l10n.app_name,
            style: Theme.of(context).textTheme.titleLarge,
          )
        ],
      ),
    );
  }
}
