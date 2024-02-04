import 'package:flutter/material.dart';

import 'package:banca_creditos/config/localization/app_localization.dart';
import 'package:banca_creditos/presentation/widgets/app_column_header_container.dart';
import 'package:banca_creditos/presentation/widgets/app_data_row_container.dart';



class SimulateDataTable extends StatelessWidget {

  const SimulateDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width*0.9,
      child: Theme(
        data: Theme.of(context).copyWith(
            dividerTheme: const DividerThemeData(color: Colors.transparent)
        ),
        child: DataTable(
          dataRowMaxHeight: 35,
          dataRowMinHeight: 35,
          headingRowHeight: 40,
          columns: const <DataColumn>[
            DataColumn(
              label: AppColumnHeaderContainer(
                title: 'No. Cuota',
                portionSize: 0.2,
              )
            ),
            DataColumn(
              label: AppColumnHeaderContainer(
                title: 'Valor de cuota',
                portionSize: 0.3,
              )
            ),
            DataColumn(
              label: AppColumnHeaderContainer(
                title: 'Interés',
                portionSize: 0.2,
              )
            ),
            DataColumn(
              label: AppColumnHeaderContainer(
                title: 'Abono a capital',
                portionSize: 0.3,
              )
            ),
          ],
          rows: const <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(
                  AppDataRowContainer(
                    text: '1',
                    bottomBorderSide: BorderSide.none
                  ),
                ),
                DataCell(
                  AppDataRowContainer(
                    text: '\$12.000.000',
                    textColor: Colors.grey,
                    leftBorderSide: BorderSide.none,
                    bottomBorderSide: BorderSide.none
                  ),
                ),
                DataCell(
                  AppDataRowContainer(
                    text: '1,5%',
                    bottomBorderSide: BorderSide.none
                  ),
                ),
                DataCell(
                  AppDataRowContainer(
                    text: '\$12.000.000',
                    textColor: Color(0xff2EAE44),
                    bottomBorderSide: BorderSide.none
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


