import 'package:banca_creditos/config/localization/app_localization.dart';
import 'package:banca_creditos/presentation/modules/home/widgets/history_data_table.dart';
import 'package:flutter/material.dart';



class HistoryTap extends StatelessWidget {

  const HistoryTap({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(
        left: width*0.05,
        right: width*0.05
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Historial de créditos',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              'Aquí encontrarás tu historial de créditos y el registro de todas las simulaciones..',
              style: Theme.of(context).textTheme.bodyLarge
            ),
            SizedBox(height: height*0.01),
            const Divider(color: Color(0xFFB1B5BB)),

            const HistoryDataTable(),

            SizedBox(height: height*0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: Colors.grey, size: 26),
                const SizedBox(width: 5),
                Text(
                  'No hay mas datos por mostrar',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}