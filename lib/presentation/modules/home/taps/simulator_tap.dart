import 'package:banca_creditos/config/localization/app_localization.dart';
import 'package:banca_creditos/presentation/modules/home/widgets/home_app_bar.dart';
import 'package:banca_creditos/presentation/widgets/app_filled_button.dart';
import 'package:banca_creditos/presentation/widgets/app_text_field.dart';
import 'package:flutter/material.dart';



class SimulatorTab extends StatelessWidget {

  const SimulatorTab({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        const HomeAppBar(),
        Padding(
          padding: EdgeInsets.only(
            top: height*0.06,
            left: width*0.05,
            right: width*0.05
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Simulador de Crédito',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary
                      ),
                    ),
                    const SizedBox(width: 5),
                    Icon(Icons.error_outline, color: Theme.of(context).colorScheme.primary, size: 26),
                  ],
                ),
                Text(
                  'Ingresa los datos para tu crédito según lo que necesites.',
                  style: Theme.of(context).textTheme.bodyLarge
                ),
                SizedBox(height: height*0.02),
                AppTextField(
                  label: '¿Qué tipo de créditos deseas realizar?',
                  labelTextColor: Colors.black,
                  hintText: 'Selecciona el tipo de créditos',
                  onChanged: (value) {

                  },
                ),
                AppTextField(
                  label: '¿Cuántos es tu salario base?',
                  labelTextColor: Colors.black,
                  hintText: "\$ 10'000.000,00",
                  helperText: 'Digita tu salario para calcular el préstamo que necesitas',
                  onChanged: (value) {

                  },
                ),
                AppTextField(
                  isEnabled: false,
                  labelTextColor: Colors.black,
                  hintText: '\$ 0',
                  onChanged: (value) {

                  },
                ),
                AppTextField(
                  label: '¿A cuántos meses?',
                  labelTextColor: Colors.black,
                  hintText: '48',
                  helperText: 'Elija un plazo desde 12 hasta 84 meses',
                  onChanged: (value) {

                  },
                ),
                SizedBox(height: height*0.03),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width*0.04),
                  child: AppFilledButton(
                    text: 'Simular',
                    onPressed: () {

                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
