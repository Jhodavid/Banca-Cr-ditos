
class CreditAmortizationEntity {

  final double balance;
  final int quotaNumber;
  final double quota;
  final double interest;
  final double principalPayment;
  final double balanceForPeriod;

  CreditAmortizationEntity({
    required this.balance,
    required this.quotaNumber,
    required this.quota,
    required this.interest,
    required this.principalPayment,
    required this.balanceForPeriod
  });

}