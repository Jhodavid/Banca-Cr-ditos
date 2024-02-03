import 'package:banca_creditos/presentation/widgets/app_filled_button.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:banca_creditos/config/localization/app_localization.dart';
import 'package:banca_creditos/config/router/app_routes.dart';
import 'package:banca_creditos/presentation/modules/on_boarding/widgets/on_boarding_image_and_message.dart';



class OnBoardingPage extends StatelessWidget {
  
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {

    final l10n = context.l10n;
    final width = MediaQuery.of(context).size.width;

    final topDevicePadding = MediaQuery.of(context).padding.top;
    final bottomDevicePadding = MediaQuery.of(context).padding.bottom;

    //todo: Hacer reutilizable el componente
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            controller: PageController(),
            children: [
              OnBoardingImageAndMessage(
                imagePath: 'assets/on_boarding_1.png',
                message: l10n.on_boarding_first_message
              ),
              OnBoardingImageAndMessage(
                imagePath: 'assets/on_boarding_2.png',
                message: l10n.on_boarding_second_message
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(
              top: topDevicePadding+10,
              left: width*0.01,
              right: width*0.01,
            ),
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: (width*0.84)/2,
                  child: LinearProgressIndicator(
                    value: 1,
                    borderRadius: BorderRadius.circular(5),
                  )
                ),
                SizedBox(
                  width: (width*0.84)/2,
                  child: LinearProgressIndicator(
                    value: 0.1,
                    borderRadius: BorderRadius.circular(5),
                  )
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width*0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppFilledButton(
                  text: l10n.on_boarding_sign_in,
                  onPressed: () => context.push(AppRoutesEnum.singIn.path),
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                ),
                const SizedBox(height: 5),
                AppFilledButton(
                  text: l10n.on_boarding_sign_up,
                  onPressed: () => context.push(AppRoutesEnum.signUp.path)
                ),
                SizedBox(height: bottomDevicePadding+55),
              ],
            ),
          )
        ],
      ),
    );
  }
}