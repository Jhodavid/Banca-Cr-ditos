import 'package:banca_creditos/presentation/modules/home/widgets/simulate_data_table.dart';
import 'package:banca_creditos/presentation/widgets/app_filled_button.dart';
import 'package:flutter/material.dart';



class SimulateDetailFrame extends StatelessWidget {

  const SimulateDetailFrame({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Resultado de tu\nsimulador de crédito',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Text(
            'Te presentamos en tu tabla de amortización el resultado del movimiento de tu crédito',
            style: Theme.of(context).textTheme.bodyLarge
          ),
          SizedBox(height: height*0.015),
          Text(
            'Tabla de créditos',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SimulateDataTable(),
          const Spacer(),
          AppFilledButton(
            text: 'Descargar tabla',
            onPressed: () {

            },
          ),
          SizedBox(height: height*0.01)
        ],
      ),
    );
  }
}
