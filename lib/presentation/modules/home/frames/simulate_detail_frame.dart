import 'package:banca_creditos/domain/entities/user_entity.dart';
import 'package:banca_creditos/presentation/modules/home/providers/simulator_provider.dart';
import 'package:flutter/material.dart';


import 'package:banca_creditos/config/localization/app_localization.dart';
import 'package:banca_creditos/presentation/widgets/app_filled_button.dart';
import 'package:banca_creditos/presentation/modules/home/widgets/simulate_data_table.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class SimulateDetailFrame extends ConsumerWidget {

  const SimulateDetailFrame({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    final height = MediaQuery.of(context).size.height;

    final simulateState = ref.watch(simulatorProvider);
    final simulateNotifier = ref.watch(simulatorProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.home_result_your_credit_simulator,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Text(
          l10n.home_we_show_your_amortization_table,
          style: Theme.of(context).textTheme.bodyLarge
        ),
        SizedBox(height: height*0.015),
        Text(
          l10n.home_credit_table,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        SizedBox(
          height: height-410,
          child: SimulateDataTable(
            creditSimulation: CreditSimulationEntity(
              typeCredit: simulateState.typeCredit!,
              baseSalary: simulateState.salary!,
              numberOfMonths: simulateState.numberOfMonths!
            ),
            calculateCreditValue: simulateState.calculateCreditValue,
          ),
        ),
        const Spacer(),
        AppFilledButton(
          text: l10n.home_download_table,
          onPressed: () {

          },
        ),
        SizedBox(height: height*0.01)
      ],
    );
  }
}
