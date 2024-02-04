
enum AppRoutesEnum {
  onBoarding,
  signUp,
  singIn,
  signUpCheck,
  home,
  historyDetail
}

extension AppRoutesEnumExtension on AppRoutesEnum {
  String get path {
    switch(this) {
      case AppRoutesEnum.onBoarding: return '/onBoarding';
      case AppRoutesEnum.signUp: return '/signUp';
      case AppRoutesEnum.singIn: return '/singIn';
      case AppRoutesEnum.signUpCheck: return '/signUpCheck';
      case AppRoutesEnum.home: return '/home';
      case AppRoutesEnum.historyDetail: return '/historyDetail';
    }
  }
}