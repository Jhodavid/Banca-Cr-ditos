import 'dart:math';

import 'package:banca_creditos/domain/entities/credit_amortization_entity.dart';
import 'package:banca_creditos/domain/entities/type_credits_enum.dart';
import 'package:banca_creditos/domain/entities/user_entity.dart';
import 'package:banca_creditos/presentation/modules/home/utils/input_formatters.dart';
import 'package:flutter/material.dart';

import 'package:banca_creditos/config/localization/app_localization.dart';
import 'package:banca_creditos/presentation/widgets/app_column_header_container.dart';
import 'package:banca_creditos/presentation/widgets/app_data_row_container.dart';



class SimulateDataTable extends StatelessWidget {

  final CreditSimulationEntity creditSimulation;
  final int calculateCreditValue;

  const SimulateDataTable({
    super.key,
    required this.creditSimulation,
    required this.calculateCreditValue
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: SizedBox(
        width: width*0.9,
        child: Theme(
          data: Theme.of(context).copyWith(
            dividerTheme: const DividerThemeData(color: Colors.transparent)
          ),
          child: DataTable(
            dataRowMaxHeight: 35,
            dataRowMinHeight: 35,
            headingRowHeight: 40,
            columns: <DataColumn>[
              DataColumn(
                label: AppColumnHeaderContainer(
                  title: l10n.home_no_installments,
                  portionSize: 0.1,
                )
              ),
              DataColumn(
                label: AppColumnHeaderContainer(
                  title: l10n.home_installments_value,
                  portionSize: 0.31,
                )
              ),
              DataColumn(
                label: AppColumnHeaderContainer(
                  title: l10n.home_interest,
                  portionSize: 0.31,
                )
              ),
              DataColumn(
                label: AppColumnHeaderContainer(
                  title: l10n.home_capital_credit,
                  portionSize: 0.28,
                )
              ),
            ],
            rows: List<DataRow>.from(
              _getAmortizationTable(
                calculateCreditValue: calculateCreditValue,
                simulation: creditSimulation
              ).map((amortization) => DataRow(
                  cells: <DataCell>[
                    DataCell(
                      AppDataRowContainer(
                        text: '${amortization.quotaNumber}',
                        bottomBorderSide: BorderSide.none
                      ),
                    ),
                    DataCell(
                      AppDataRowContainer(
                        text: CurrencyInputFormatter.format(('${amortization.quota}').toString()),
                        textColor: Colors.grey,
                        leftBorderSide: BorderSide.none,
                        bottomBorderSide: BorderSide.none
                      ),
                    ),
                    DataCell(
                      AppDataRowContainer(
                        text: CurrencyInputFormatter.format(('${amortization.interest}').toString()),
                        bottomBorderSide: BorderSide.none
                      ),
                    ),
                    DataCell(
                      AppDataRowContainer(
                        text: CurrencyInputFormatter.format(('${amortization.principalPayment}').toString()),
                        textColor: const Color(0xff2EAE44),
                        bottomBorderSide: BorderSide.none
                      ),
                    ),
                  ],
                )
              )
            ).toList()
          ),
        ),
      ),
    );
  }

  List<CreditAmortizationEntity> _getAmortizationTable({
    required int calculateCreditValue,
    required CreditSimulationEntity simulation
  }) {
    final list = <CreditAmortizationEntity>[];
    double currentBalance = calculateCreditValue.toDouble();
    final double quotaValue = (currentBalance * simulation.typeCredit.interest) / (1 - pow(1 + simulation.typeCredit.interest, -simulation.numberOfMonths));

    int quotaNumber = 1;

    while(currentBalance > 0) {

      final interest = currentBalance * simulation.typeCredit.interest;
      final principalPayment = quotaValue - interest;
      final balanceForPeriod = currentBalance-principalPayment;

      list.add(CreditAmortizationEntity(
        balance: currentBalance,
        quotaNumber: quotaNumber,
        quota: quotaValue,
        interest: interest,
        principalPayment: principalPayment,
        balanceForPeriod: balanceForPeriod
      ));

      currentBalance = balanceForPeriod;
      quotaNumber++;
    }

    return list;
  }

}
