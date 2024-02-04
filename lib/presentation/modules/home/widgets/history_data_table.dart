import 'package:banca_creditos/config/localization/app_localization.dart';
import 'package:banca_creditos/presentation/widgets/app_data_row_container.dart';
import 'package:flutter/material.dart';



class HistoryDataTable extends StatelessWidget {

  const HistoryDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width*0.9,
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerTheme: const DividerThemeData(color: Colors.transparent)
        ),
        child: DataTable(
          dataRowMaxHeight: 35,
          dataRowMinHeight: 35,
          columns: const <DataColumn>[
            DataColumn(
              label: _HeaderContainer(
                title: 'Monto de crédito',
                portionSize: 0.36,
              )
            ),
            DataColumn(
              label: _HeaderContainer(
                title: 'Fecha',
                portionSize: 0.19,
              )
            ),
            DataColumn(
              label: _HeaderContainer(
                title: 'No. de cuotas',
                portionSize: 0.3,
              )
            ),
            DataColumn(
              label: _HeaderContainer(
                title: 'Interés',
                portionSize: 0.15,
              )
            ),
          ],
          rows: const <DataRow>[
            DataRow(
              cells: <DataCell>[
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
                    text: '12/10/23',
                    bottomBorderSide: BorderSide.none
                  ),
                ),
                DataCell(
                  AppDataRowContainer(
                    text: '48',
                    bottomBorderSide: BorderSide.none
                  ),
                ),
                DataCell(
                  AppDataRowContainer(
                    text: '1,5%',
                    bottomBorderSide: BorderSide.none
                  ),
                )
              ],
            ),
            DataRow(
              cells: <DataCell>[
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
                    text: '12/10/23',
                    bottomBorderSide: BorderSide.none
                  ),
                ),
                DataCell(
                  AppDataRowContainer(
                    text: '48',
                    bottomBorderSide: BorderSide.none
                  ),
                ),
                DataCell(
                  AppDataRowContainer(
                    text: '1,5%',
                    bottomBorderSide: BorderSide.none
                  ),
                )
              ],
            ),
            DataRow(
              cells: <DataCell>[
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
                    text: '12/10/23',
                    bottomBorderSide: BorderSide.none
                  ),
                ),
                DataCell(
                  AppDataRowContainer(
                    text: '48',
                    bottomBorderSide: BorderSide.none
                  ),
                ),
                DataCell(
                  AppDataRowContainer(
                    text: '1,5%',
                    bottomBorderSide: BorderSide.none
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}



class _HeaderContainer extends StatelessWidget {

  final String title;
  final double portionSize;

  const _HeaderContainer({
    required this.title,
    required this.portionSize
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      alignment: Alignment.center,
      width: (width*0.9)*portionSize,
      child: Text(
        title
      ),
    );
  }
}
