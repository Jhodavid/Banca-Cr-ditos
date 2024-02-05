
import 'package:banca_creditos/config/localization/app_localization.dart';

enum TypeCreditsEnum {
  vehicleCredit,
  housingCredit,
  freeInvestmentCredit
}

extension TypeCreditsEnumExtension on TypeCreditsEnum {
  String getName(AppLocalizations l10n) {
    switch(this) {
      case TypeCreditsEnum.vehicleCredit: return l10n.type_credit_vehicle;
      case TypeCreditsEnum.housingCredit: return l10n.type_credit_housing;
      case TypeCreditsEnum.freeInvestmentCredit: return l10n.type_credit_free_investment;
    }
  }

  double get interest {
    switch(this) {
      case TypeCreditsEnum.vehicleCredit: return 0.3;
      case TypeCreditsEnum.housingCredit: return 0.1;
      case TypeCreditsEnum.freeInvestmentCredit: return 0.35;
    }
  }
}