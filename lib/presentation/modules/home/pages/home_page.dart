import 'package:banca_creditos/presentation/modules/home/taps/history_tap.dart';
import 'package:banca_creditos/presentation/modules/home/taps/simulator_detail_tap.dart';
import 'package:banca_creditos/presentation/modules/home/taps/simulator_tap.dart';
import 'package:banca_creditos/presentation/modules/home/utils/home_module_utils.dart';
import 'package:banca_creditos/presentation/widgets/app_filled_button.dart';
import 'package:banca_creditos/presentation/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

import 'package:banca_creditos/config/localization/app_localization.dart';



class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final topDevicePadding = MediaQuery.of(context).padding.top;
    final bottomDevicePadding = MediaQuery.of(context).padding.bottom;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GestureDetector(
        onTap: () => WidgetsBinding.instance.focusManager.primaryFocus?.unfocus(),
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.only(
            top: topDevicePadding + (height*0.05),
            bottom: bottomDevicePadding+20
          ),
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: HomeModuleUtils.homePageViewController,
            onPageChanged: (value) {
              setState(() {
                if(value >= 2) {
                  _pageIndex = 0;
                  return;
                }
                _pageIndex = value;
              });
            },
            children: const [
              SimulatorTab(),
              HistoryTap(),
              SimulatorDetailTap()
            ],
          ),
        )
      ),
      bottomSheet: BottomNavigationBar(
        currentIndex: _pageIndex,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home_rounded
            ),
            label: l10n.home_principal
          ),
          BottomNavigationBarItem(
            // backgroundColor: MyLightTheme.btnGreen,
            icon: const Icon(
              Icons.wallet_rounded
            ),
            label: l10n.home_credit_history
          )
        ],
        onTap: (value) => HomeModuleUtils.homePageViewController.jumpToPage(value),
      )
    );
  }
}
