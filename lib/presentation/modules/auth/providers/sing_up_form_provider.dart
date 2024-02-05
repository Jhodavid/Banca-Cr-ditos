import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:banca_creditos/domain/entities/user_entity.dart';
import 'package:banca_creditos/presentation/providers/current_user_data_provider.dart';

import 'package:banca_creditos/infraestruture/utils/AppExceptions.dart';
import 'package:banca_creditos/infraestruture/datasources/isar_and_secure_storage_local_user_datasource_impl.dart';
import 'package:banca_creditos/infraestruture/repositories/local_user_repository_impl.dart';



final singUpFormProvider = StateNotifierProvider<SingUpFormNotifier, SingUpFormState>((ref) {
  final currentUserDataNotifier = ref.read(currentUserDataProvider.notifier);
  final localUserRepository = LocalUserRepositoryImpl(IsarAndSecureStorageLocalUserDatasourceImpl());

  return SingUpFormNotifier(
    currentUserDataNotifier: currentUserDataNotifier,
    localUserRepository: localUserRepository
  );
});


class SingUpFormNotifier extends StateNotifier<SingUpFormState> {

  final CurrentUserDataNotifier currentUserDataNotifier;
  final LocalUserRepositoryImpl localUserRepository;

  SingUpFormNotifier({
    required this.currentUserDataNotifier,
    required this.localUserRepository,
  }) : super(const SingUpFormState());

  void onChangedFullName(String value) {
    state = state.copyWith(
      fullName: value
    );
  }
  void onChangedId(String value) {
    state = state.copyWith(
      id: value
    );
  }
  void onChangedEmail(String value) {
    state = state.copyWith(
      email: value
    );
  }
  void onChangedPassword(String value) {
    state = state.copyWith(
      password: value
    );
  }
  void onPressedAcceptedTermsAndConditions() {
    state = state.copyWith(
      isAcceptedTermsAndConditions: !state.isAcceptedTermsAndConditions
    );
  }

  Future<void> onPressedContinue({
    required String unCompletedFieldsMessage,
    required String termsAndConditionsNotAcceptedMessage
  }) async {
    if(
      state.fullName.isEmpty ||
      state.id.isEmpty ||
      state.email.isEmpty ||
      state.password.isEmpty
    ) {
      throw CustomError(unCompletedFieldsMessage);
    }

    if(!state.isAcceptedTermsAndConditions) {
      throw CustomError(termsAndConditionsNotAcceptedMessage);
    }

    final user = UserEntity(
      fullName: state.fullName,
      id: state.id,
      email: state.email
    );

    await localUserRepository.singUp(
      user,
      state.password
    );
    currentUserDataNotifier.setUser(user);
  }
}

class SingUpFormState {

  final bool isLoading;
  final String fullName;
  final String id;
  final String email;
  final String password;
  final bool isAcceptedTermsAndConditions;

  const SingUpFormState({
    this.isLoading = false,
    this.fullName = '',
    this.id = '',
    this.email = '',
    this.password = '',
    this.isAcceptedTermsAndConditions = false
  });

  SingUpFormState copyWith({
    bool? isLoading,
    String? fullName,
    String? id,
    String? email,
    String? password,
    bool? isAcceptedTermsAndConditions
  }) => SingUpFormState(
    isLoading: isLoading ?? this.isLoading,
    fullName: fullName ?? this.fullName,
    id: id ?? this.id,
    email: email ?? this.email,
    password: password ?? this.password,
    isAcceptedTermsAndConditions: isAcceptedTermsAndConditions ?? this.isAcceptedTermsAndConditions
  );

}