import 'package:flutter/material.dart';


import 'package:banca_creditos/config/localization/app_localization.dart';
import 'package:banca_creditos/presentation/modules/home/widgets/floating_button_close_bottom_sheet.dart';



class SimulateModalBottomSheet extends StatelessWidget {

  const SimulateModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width*0.05,
        vertical: height*0.02
      ),
      child: Column(
        children: [
          SizedBox(
            width: width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width*0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.home_maximum_loan_installment,
                        style: Theme.of(context).textTheme.labelLarge
                      ),
                      Text(
                        '\$185.798.098,00',
                        style: Theme.of(context).textTheme.displayMedium
                      ),
                      Text(
                        l10n.home_this_value_usually_changes_with_your_salary,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary
                        )
                      ),
                    ],
                  ),
                ),
                const FloatingButtonCloseBottomSheet()
              ],
            ),
          ),
          SizedBox(height: height*0.02),
          _LabelAndValueData(
            title: l10n.home_annual_percentage_rate,
            value: '43.26%'
          ),
          _LabelAndValueData(
            title: l10n.home_monthly_percentage_rate,
            value: '3.04%'
          ),
          _LabelAndValueData(
            title: l10n.home_total_amount,
            value: '\$950'
          ),
          SizedBox(height: height*0.01),
          const Divider(color: Color(0xffDFEAFB)),
          SizedBox(height: height*0.01),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.home_principal_interest_insurance,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                '\$1.112.501',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          )
        ],
      ),
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
