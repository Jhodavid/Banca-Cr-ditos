import 'package:banca_creditos/config/localization/app_localization.dart';
import 'package:banca_creditos/presentation/modules/home/utils/home_module_utils.dart';
import 'package:banca_creditos/presentation/modules/home/widgets/home_app_bar.dart';
import 'package:banca_creditos/presentation/modules/home/widgets/simulate_modal_bottom_sheet.dart';
import 'package:banca_creditos/presentation/widgets/app_filled_button.dart';
import 'package:banca_creditos/presentation/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



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
                      l10n.home_credit_simulator,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary
                      ),
                    ),
                    const SizedBox(width: 5),
                    TextButton(
                      child: Icon(
                        Icons.error_outline,
                        color: Theme.of(context).colorScheme.primary,
                        size: 26
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          constraints: BoxConstraints(
                            maxHeight: height*0.45
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          context: context,
                            builder: (_) {
                              return const SimulateModalBottomSheet();
                            },
                        );
                      },
                    ),
                  ],
                ),
                Text(
                    l10n.home_enter_data_for_your_credit,
                  style: Theme.of(context).textTheme.bodyLarge
                ),
                SizedBox(height: height*0.02),
                AppTextField(
                  label: l10n.home_what_type_credit,
                  labelTextColor: Colors.black,
                  hintText: l10n.home_what_select_credit_type,
                  onChanged: (value) {

                  },
                ),
                AppTextField(
                  label: l10n.home_how_much_your_salary,
                  labelTextColor: Colors.black,
                  hintText: "\$ 10'000.000,00",
                  helperText: l10n.home_enter_your_salary_to_calculate,
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
                  label: l10n.home_how_many_months,
                  labelTextColor: Colors.black,
                  hintText: '48',
                  helperText: l10n.home_choose_term_12_to_84_months,
                  onChanged: (value) {

                  },
                ),
                SizedBox(height: height*0.03),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width*0.04),
                  child: AppFilledButton(
                    text: l10n.home_simulate,
                    onPressed: () => HomeModuleUtils.homePageViewController.jumpToPage(2)
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