
enum TypeCreditsEnum {
  none,
  vehicleCredit,
  housingCredit,
  freeInvestmentCredit
}

extension TypeCreditsEnumExtension on TypeCreditsEnum {
  double get interest {
    switch(this) {
      case TypeCreditsEnum.none: return 0;
      case TypeCreditsEnum.vehicleCredit: return 0.3;
      case TypeCreditsEnum.housingCredit: return 0.1;
      case TypeCreditsEnum.freeInvestmentCredit: return 0.35;
    }
  }
}