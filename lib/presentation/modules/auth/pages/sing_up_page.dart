import 'package:banca_creditos/presentation/modules/auth/providers/sing_up_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';


import 'package:banca_creditos/config/router/app_routes.dart';
import 'package:banca_creditos/presentation/widgets/app_logo.dart';
import 'package:banca_creditos/presentation/widgets/app_text_field.dart';
import 'package:banca_creditos/config/localization/app_localization.dart';
import 'package:banca_creditos/presentation/widgets/app_filled_button.dart';



class SingUpPage extends ConsumerWidget {

  const SingUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    final topDevicePadding = MediaQuery.of(context).padding.top;
    final bottomDevicePadding = MediaQuery.of(context).padding.bottom;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final singUpFormState = ref.watch(singUpFormProvider);
    final singUpFormNotifier = ref.watch(singUpFormProvider.notifier);

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
                Text(
                  l10n.auth_register_in,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  l10n.auth_only_take_few_minutes,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(height: height*0.03),
                Form(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width*0.85,
                        child: Column(
                          children: [
                            AppTextField(
                              label: l10n.auth_full_name_label,
                              hintText: l10n.auth_full_name_hint,
                              prefixIconData: Icons.person_outline,
                              onChanged: singUpFormNotifier.onChangedFullName,
                            ),
                            AppTextField(
                              label: l10n.auth_id_label,
                              hintText: l10n.auth_id_hint,
                              onChanged: singUpFormNotifier.onChangedId,
                            ),
                            AppTextField(
                              label: l10n.auth_email_label,
                              hintText: l10n.auth_email_hint,
                              prefixIconData: Icons.person_outline,
                              onChanged: singUpFormNotifier.onChangedEmail,
                            ),
                            AppTextField(
                              label: l10n.auth_password_label,
                              hintText: l10n.auth_password_hint,
                              prefixIconData: Icons.lock_outline,
                              onChanged: singUpFormNotifier.onChangedPassword,
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ),
                SizedBox(
                  width: width*0.9,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: singUpFormState.isAcceptedTermsAndConditions,
                        checkColor: Colors.white,
                        fillColor: singUpFormState.isAcceptedTermsAndConditions ? MaterialStatePropertyAll<Color>(Theme.of(context).colorScheme.primary) : null,
                        onChanged: (_) => singUpFormNotifier.onPressedAcceptedTermsAndConditions(),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 15),
                        width: width*0.9-50,
                        child: RichText(
                          text: TextSpan(
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: l10n.auth_term_and_policy_part_1,
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: Colors.black
                              )
                            ),
                            TextSpan(
                              text: l10n.auth_term_and_policy_part_2,
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: Theme.of(context).colorScheme.primary
                              )
                            ),
                            TextSpan(
                              text: l10n.auth_term_and_policy_part_3,
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: Colors.black
                              )
                            ),
                            TextSpan(
                              text: l10n.auth_term_and_policy_part_4,
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: Theme.of(context).colorScheme.primary
                              )
                            ),
                            TextSpan(
                              text: l10n.auth_term_and_policy_part_5,
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: Colors.black
                              )
                            ),
                            TextSpan(
                              text: l10n.auth_term_and_policy_part_6,
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: Theme.of(context).colorScheme.primary
                              )
                            ),
                            TextSpan(
                              text: l10n.auth_term_and_policy_part_7,
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: Colors.black
                              )
                            ),
                          ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height*0.025),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width*0.04),
                  child: AppFilledButton(
                    text: l10n.auth_continue,
                    onPressed: () => context.push(AppRoutesEnum.signUpCheck.path),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        l10n.auth_do_you_have_account,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Colors.grey
                      )
                    ),
                    TextButton(
                      onPressed: () => context.push(AppRoutesEnum.singIn.path),
                      child: Text(
                        l10n.auth_log_in,
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
