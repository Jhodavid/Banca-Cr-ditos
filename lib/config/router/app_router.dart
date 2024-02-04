import 'package:banca_creditos/presentation/modules/home/pages/history_detail_page.dart';
import 'package:go_router/go_router.dart';


import 'package:banca_creditos/config/router/app_routes.dart';

import 'package:banca_creditos/presentation/modules/on_boarding/on_boarding_page.dart';
import 'package:banca_creditos/presentation/modules/auth/pages/sing_up_page.dart';
import 'package:banca_creditos/presentation/modules/auth/pages/sing_up_check_page.dart';
import 'package:banca_creditos/presentation/modules/auth/pages/sing_in_page.dart';
import 'package:banca_creditos/presentation/modules/home/pages/home_page.dart';



final appRouter = GoRouter(
  initialLocation: AppRoutesEnum.onBoarding.path,
  routes: [
    GoRoute(
      path: AppRoutesEnum.onBoarding.path,
      builder: (context, state) => const OnBoardingPage(),
    ),
    GoRoute(
      path: AppRoutesEnum.signUp.path,
      builder: (context, state) => const SingUpPage(),
    ),
    GoRoute(
      path: AppRoutesEnum.singIn.path,
      builder: (context, state) => const SingInPage(),
    ),
    GoRoute(
      path: AppRoutesEnum.signUpCheck.path,
      builder: (context, state) => const SingUpCheckPage(),
    ),
    GoRoute(
      path: AppRoutesEnum.home.path,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: AppRoutesEnum.historyDetail.path,
      builder: (context, state) => const HistoryDetailPage(), // todo: pasar por parámetro los datos
    )
  ],
  redirect: (context, state) {
    // todo: validar sesión activa
    return null;
  },
);