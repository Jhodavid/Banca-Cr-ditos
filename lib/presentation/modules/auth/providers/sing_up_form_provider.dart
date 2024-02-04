import 'package:flutter_riverpod/flutter_riverpod.dart';



final singUpFormProvider = StateNotifierProvider<SingUpFormNotifier, SingUpFormState>((ref) {
  return SingUpFormNotifier();
});


class SingUpFormNotifier extends StateNotifier<SingUpFormState> {

  SingUpFormNotifier() : super(const SingUpFormState());

  void onChangedFullName(String value) {
    state = state.copyWith(
      fullName: value
    );
  }
  void onChangedId(String value) {
    state = state.copyWith(
      fullName: value
    );
  }
  void onChangedEmail(String value) {
    state = state.copyWith(
      fullName: value
    );
  }
  void onChangedPassword(String value) {
    state = state.copyWith(
      fullName: value
    );
  }

  void onPressedAcceptedTermsAndConditions() {
    state = state.copyWith(
      isAcceptedTermsAndConditions: !state.isAcceptedTermsAndConditions
    );
  }

}

class SingUpFormState {

  final String fullName;
  final String id;
  final String email;
  final String password;
  final bool isAcceptedTermsAndConditions;

  const SingUpFormState({
    this.fullName = '',
    this.id = '',
    this.email = '',
    this.password = '',
    this.isAcceptedTermsAndConditions = false
  });

  SingUpFormState copyWith({
    String? fullName,
    String? id,
    String? email,
    String? password,
    bool? isAcceptedTermsAndConditions
  }) => SingUpFormState(
    fullName: fullName ?? this.fullName,
    id: id ?? this.id,
    email: email ?? this.email,
    password: password ?? this.password,
    isAcceptedTermsAndConditions: isAcceptedTermsAndConditions ?? this.isAcceptedTermsAndConditions
  );

}