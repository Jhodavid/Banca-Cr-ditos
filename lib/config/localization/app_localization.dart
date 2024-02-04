import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';


extension AppLocalization on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);

  String getHomeHiUser(String fullName) {
    String text = l10n.home_hi_user;
    text = text.replaceAll('[fullName]', fullName);
    return text;
  }
}
