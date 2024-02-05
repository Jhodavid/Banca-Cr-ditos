import 'package:banca_creditos/config/localization/app_localization.dart';
import 'package:banca_creditos/presentation/modules/home/widgets/save_simulate_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';

import 'package:banca_creditos/presentation/widgets/app_filled_button.dart';
import 'package:banca_creditos/presentation/modules/home/widgets/home_app_bar.dart';
import 'package:banca_creditos/presentation/modules/home/frames/simulate_detail_frame.dart';



class SimulatorDetailTap extends StatelessWidget {

  const SimulatorDetailTap({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        const HomeAppBar(isVisibleMessage: false),
        Padding(
          padding: EdgeInsets.only(
            top: 12,
            left: width*0.05,
            right: width*0.05
          ),
          child: Column(
            children: [
              SizedBox(
                height: height-190,
                child: const SimulateDetailFrame()
              ),
              AppFilledButton(
                text: l10n.home_save_quote,
                backgroundColor: Colors.white,
                textColor: Theme.of(context).colorScheme.primary,
                borderColor: Theme.of(context).colorScheme.primary,
                onPressed: () {
                  showModalBottomSheet(
                    constraints: BoxConstraints(
                      maxHeight: height*0.48
                    ),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    context: context,
                    builder: (_) {
                      return const SaveSimulateModalBottomSheet();
                    },
                  );
                },
              ),
              SizedBox(height: height*0.05)
            ],
          ),
        )
      ],
    );
  }
}
