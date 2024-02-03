import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';


import 'package:banca_creditos/config/router/app_routes.dart';



final appRouter = GoRouter(
  initialLocation: AppRoutesEnum.onBoarding.path,
  routes: [
    GoRoute(
      path: AppRoutesEnum.onBoarding.path,
      builder: (context, state) => Placeholder(child: Text(AppRoutesEnum.onBoarding.name)),
    ),
    GoRoute(
      path: AppRoutesEnum.signUp.path,
      builder: (context, state) => Placeholder(child: Text(AppRoutesEnum.signUp.name)),
    ),
    GoRoute(
      path: AppRoutesEnum.login.path,
      builder: (context, state) => Placeholder(child: Text(AppRoutesEnum.login.name)),
    ),
    GoRoute(
      path: AppRoutesEnum.check.path,
      builder: (context, state) => Placeholder(child: Text(AppRoutesEnum.check.name)),
    ),
    GoRoute(
      path: AppRoutesEnum.home.path,
      builder: (context, state) => Placeholder(child: Text(AppRoutesEnum.home.name)),
    )
  ],
  redirect: (context, state) {
    return null;
  },
);