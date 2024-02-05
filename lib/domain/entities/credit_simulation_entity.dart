part of 'user_entity.dart';


@embedded
class CreditSimulationEntity {

  @enumerated
  final TypeCreditsEnum typeCredit;
  final double baseSalary;
  final int numberOfMonths;

  CreditSimulationEntity({
    this.typeCredit = TypeCreditsEnum.freeInvestmentCredit,
    this.baseSalary = 0,
    this.numberOfMonths = 12
  });

}