import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';


import 'package:banca_creditos/config/router/app_routes.dart';
import 'package:banca_creditos/presentation/widgets/app_logo.dart';
import 'package:banca_creditos/presentation/widgets/app_text_field.dart';
import 'package:banca_creditos/config/localization/app_localization.dart';
import 'package:banca_creditos/presentation/widgets/app_filled_button.dart';
import 'package:banca_creditos/presentation/modules/auth/widgets/external_auth_filled_button.dart';



class SingInPage extends StatelessWidget {

  const SingInPage({super.key});

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
            top: topDevicePadding + (height*0.06),
            bottom: bottomDevicePadding+20
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const AppLogo(),
                SizedBox(height: height*0.03),
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  width: width*0.9-50,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: l10n.auth_sing_in_message_part_1,
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          )
                        ),
                        TextSpan(
                          text: l10n.auth_sing_in_message_part_2,
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.black)
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height*0.05),
                Form(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width*0.85,
                        child: Column(
                          children: [
                            AppTextField(
                              label: l10n.auth__email_or_user_label,
                              hintText: l10n.auth_email_hint,
                              prefixIconData: Icons.person_outline,
                              onChanged: (value) {

                              },
                            ),
                            AppTextField(
                              label: l10n.auth_password_label,
                              hintText: l10n.auth_password_hint,
                              prefixIconData: Icons.lock_outline,
                              onChanged: (value) {

                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ),
                SizedBox(
                  width: width*0.9+5,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: false,
                        checkColor: Colors.white,
                        fillColor: false ? MaterialStatePropertyAll<Color>(Theme.of(context).colorScheme.primary) : null,
                        onChanged: (value) {

                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          l10n.auth_remember,
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.black)
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () => context.push(AppRoutesEnum.signUp.path),
                        child: Text(
                          l10n.auth_forgot_password,
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Theme.of(context).colorScheme.primary
                          )
                        ),
                      ),
                      const SizedBox(width: 5)
                    ],
                  ),
                ),
                SizedBox(height: height*0.012),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width*0.04),
                  child: AppFilledButton(
                    text: l10n.auth_do_log_in,
                    onPressed: () {

                    },
                  ),
                ),
                SizedBox(height: height*0.02),
                SizedBox(
                  height: 20,
                  width: width*0.85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: (width*0.425)-12,
                        child: const Divider(
                          color: Color(0xffC8D0D9),
                          height: 1,
                          thickness: 1
                        )
                      ),
                      const Icon(
                        Icons.circle_outlined,
                        color: Color(0xffC8D0D9),
                        size: 12,
                      ),
                      SizedBox(
                        width: (width*0.425)-12,
                        child: const Divider(
                          color: Color(0xffC8D0D9),
                          height: 1,
                          thickness: 1
                        )
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height*0.015),
                ExternalAuthFilledButton(
                  text: l10n.auth_sign_in_google,
                  iconPath: 'assets/google.png',
                  onPressed: () {

                  },
                ),
                SizedBox(height: height*0.01),
                ExternalAuthFilledButton(
                  text: l10n.auth_sign_in_apple,
                  iconPath: 'assets/apple.png',
                  onPressed: () {

                  },
                ),
                SizedBox(height: height*0.022),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        l10n.auth_dont_have_account,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Colors.grey
                      )
                    ),
                    TextButton(
                      onPressed: () => context.push(AppRoutesEnum.signUp.path),
                      child: Text(
                        l10n.auth_register_in,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary
                        )
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
