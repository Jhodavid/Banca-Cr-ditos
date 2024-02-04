import 'package:banca_creditos/presentation/widgets/app_filled_button.dart';
import 'package:flutter/material.dart';


import 'package:banca_creditos/config/localization/app_localization.dart';
import 'package:banca_creditos/presentation/modules/home/widgets/floating_button_close_bottom_sheet.dart';



class SaveSimulateModalBottomSheet extends StatelessWidget {

  const SaveSimulateModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: width*0.025),
          decoration: BoxDecoration(
            color: const Color(0xffEBEBEB),
            borderRadius: BorderRadius.circular(10)
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          padding: EdgeInsets.symmetric(
            horizontal: width*0.05
          ),
          child: Stack(
            children: [
              const Align(
                alignment: Alignment.topRight,
                child: FloatingButtonCloseBottomSheet()
              ),
              Column(
                children: [
                  Container(
                    width: width*0.2,
                    height: width*0.2,
                    decoration: BoxDecoration(
                      color: const Color(0xffF5E2E2),
                      borderRadius: BorderRadius.circular(100)
                    ),
                    padding: EdgeInsets.all(width*0.01),
                    child: Image.asset('assets/warning.png')
                  ),
                  SizedBox(height: height*0.03),
                  Text(
                    '¿Está seguro que desea\nGuardar la cotización?',
                    style: Theme.of(context).textTheme.labelLarge
                  ),
                  SizedBox(height: height*0.015),
                  Text(
                    'La cotización realizada la podrás consultar\nen tu historial de créditos.',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.grey
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: height*0.015),
                  AppFilledButton(
                    text: 'Guardar',
                    onPressed: () {

                    },
                  ),
                  SizedBox(height: height*0.005),
                  AppFilledButton(
                    text: 'Cancelar',
                    backgroundColor: Colors.white,
                    textColor: Theme.of(context).colorScheme.primary,
                    borderColor: Theme.of(context).colorScheme.primary,
                    onPressed: () {

                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class _LabelAndValueData extends StatelessWidget {

  final String title;
  final String value;

  const _LabelAndValueData({
    required this.title,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: height*0.005,
        vertical: height*0.005,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Colors.grey
            ),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}
