import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';


import 'package:banca_creditos/config/router/app_routes.dart';
import 'package:banca_creditos/config/localization/app_localization.dart';
import 'package:banca_creditos/presentation/widgets/app_filled_button.dart';



class SingUpCheckPage extends StatelessWidget {

  const SingUpCheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GestureDetector(
        onTap: () => WidgetsBinding.instance.focusManager.primaryFocus?.unfocus(),
        child: _GradiantBox(
          child: Column(
            children: [
              Container(
                width: width*0.38,
                height: width*0.38,
                margin: EdgeInsets.only(top: height*0.2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary.withOpacity(0.9),
                      Colors.white
                    ],
                    stops: const [
                      0.0,
                      0.92
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  image: const DecorationImage(
                    image: AssetImage('assets/register_success.png')
                  )
                ),
              ),
              SizedBox(height: height*0.02),
              Text(
                l10n.auth_register_success_title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: height*0.001),
              Text(
                l10n.auth_register_success_message,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height*0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width*0.04),
                child: AppFilledButton(
                  text: l10n.auth_continue,
                  onPressed: () => context.push(AppRoutesEnum.home.path),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}


class _GradiantBox extends StatelessWidget {

  final Widget child;

  const _GradiantBox({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    final topDevicePadding = MediaQuery.of(context).padding.top;
    final bottomDevicePadding = MediaQuery.of(context).padding.bottom;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.2),
            Colors.white
          ],
          stops: const [
            0.0,
            1
          ],
          center: Alignment.topCenter,
        )
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.025),
              Colors.white,
            ],
            stops: const [
              0.0,
              0.25
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        padding: EdgeInsets.only(
          top: topDevicePadding + (height*0.04),
          bottom: bottomDevicePadding+20
        ),
        child: child
      ),
    );
  }
}
