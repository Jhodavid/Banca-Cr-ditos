
enum AppRoutesEnum {
  onBoarding,
  signUp,
  login,
  check,
  home,
  homeCalculateLoan,
  homeCreditOptions,
  historyResults,
  historyDetail
}

extension AppRoutesEnumExtension on AppRoutesEnum {
  String get path {
    switch(this) {
      case AppRoutesEnum.onBoarding: return '/onBoarding';
      case AppRoutesEnum.signUp: return '/signUp';
      case AppRoutesEnum.login: return '/login';
      case AppRoutesEnum.check: return '/check';
      case AppRoutesEnum.home: return '/home';
      case AppRoutesEnum.homeCalculateLoan: return '/homeCalculateLoan';
      case AppRoutesEnum.homeCreditOptions: return '/homeCreditOptions';
      case AppRoutesEnum.historyResults: return '/historyResults';
      case AppRoutesEnum.historyDetail: return '/historyDetail';
    }
  }
}