import 'package:banca_creditos/config/localization/app_localization.dart';
import 'package:banca_creditos/config/router/app_routes.dart';
import 'package:banca_creditos/presentation/widgets/app_filled_button.dart';
import 'package:banca_creditos/presentation/widgets/app_logo.dart';
import 'package:banca_creditos/presentation/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



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
                          text: 'Inicia sesión o continua, ',
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.bold
                          )
                        ),
                        TextSpan(
                          text: 'solo te tomará unos minutos.',
                          style: Theme.of(context).textTheme.labelMedium
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
                              label: 'Email o Usuario',
                              hintText: 'Uname@mail.com',
                              prefixIconData: Icons.person_outline,
                              onChanged: (value) {

                              },
                            ),
                            AppTextField(
                              label: 'Contraseña',
                              hintText: 'Password',
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
                          'Recordarme',
                          style: Theme.of(context).textTheme.labelMedium
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () => context.push(AppRoutesEnum.signUp.path),
                        child: Text(
                          '¿Olvidé mi contraseña?',
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: Theme.of(context).colorScheme.primary
                          )
                        ),
                      ),
                      const SizedBox(width: 5)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width*0.04),
                  child: AppFilledButton(
                    text: 'Iniciar sesión',
                    onPressed: () {

                    },
                  ),
                ),

                const SizedBox(
                  height: 20,
                  child: Row(
                    children: [
                      Divider(color: Colors.grey, height: 1, thickness: 1),
                      Text('o'),
                      Divider(color: Colors.grey, height: 1)
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '¿No tienes una cuenta?',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.grey
                      )
                    ),
                    TextButton(
                      onPressed: () => context.push(AppRoutesEnum.singIn.path),
                      child: Text(
                        'Registrate',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
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
