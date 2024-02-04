part of 'user_entity.dart';


@embedded
class CreditSimulation {

  @enumerated
  final TypeCreditsEnum typeCredit;
  final double baseSalary;
  final int numberOfMonths;

  CreditSimulation({
    this.typeCredit = TypeCreditsEnum.none,
    this.baseSalary = 0,
    this.numberOfMonths = 12
  });

}