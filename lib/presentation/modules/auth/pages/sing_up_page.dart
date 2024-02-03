import 'package:banca_creditos/config/localization/app_localization.dart';
import 'package:banca_creditos/config/router/app_routes.dart';
import 'package:banca_creditos/presentation/widgets/app_filled_button.dart';
import 'package:banca_creditos/presentation/widgets/app_logo.dart';
import 'package:banca_creditos/presentation/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



class SingUpPage extends StatelessWidget {

  const SingUpPage({super.key});

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
                Text(
                  'Regístrate',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  'Solo te tomará unos minutos.',
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
                              label: 'Nombre completo',
                              hintText: 'Escribe tu nombre',
                              prefixIconData: Icons.person_outline,
                              onChanged: (value) {

                              },
                            ),
                            AppTextField(
                              label: 'Identificación',
                              hintText: 'Escribe tu número de identificación',
                              onChanged: (value) {

                              },
                            ),
                            AppTextField(
                              label: 'Email',
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
                  width: width*0.9,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: true,
                        checkColor: Colors.white,
                        fillColor: true ? MaterialStatePropertyAll<Color>(Theme.of(context).colorScheme.primary) : null,
                        onChanged: (value) {

                        },
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
                              text: 'Acepto los ',
                              style: Theme.of(context).textTheme.labelMedium
                            ),
                            TextSpan(
                              text: 'Terminos ',
                              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                color: Theme.of(context).colorScheme.primary
                              )
                            ),
                            TextSpan(
                              text: 'y ',
                              style: Theme.of(context).textTheme.labelMedium
                            ),
                            TextSpan(
                              text: 'Condiciones ',
                              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                color: Theme.of(context).colorScheme.primary
                              )
                            ),
                            TextSpan(
                              text: 'y la ',
                              style: Theme.of(context).textTheme.labelMedium
                            ),
                            TextSpan(
                              text: 'Política de privacidad ',
                              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                color: Theme.of(context).colorScheme.primary
                              )
                            ),
                            TextSpan(
                              text: 'de Banca créditos',
                              style: Theme.of(context).textTheme.labelMedium
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
                    text: 'Continuar',
                    onPressed: () {

                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '¿Ya tienes una cuenta?',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.grey
                      )
                    ),
                    TextButton(
                      onPressed: () => context.push(AppRoutesEnum.singIn.path),
                      child: Text(
                        'Inicia sesión',
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
