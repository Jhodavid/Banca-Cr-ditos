import 'package:banca_creditos/presentation/providers/current_user_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:banca_creditos/infraestruture/utils/AppExceptions.dart';
import 'package:banca_creditos/infraestruture/datasources/isar_and_secure_storage_local_user_datasource_impl.dart';
import 'package:banca_creditos/infraestruture/repositories/local_user_repository_impl.dart';



final singInFormProvider = StateNotifierProvider<SingInFormNotifier, SingInFormState>((ref) {
  final currentUserDataNotifier = ref.read(currentUserDataProvider.notifier);
  final localUserRepository = LocalUserRepositoryImpl(IsarAndSecureStorageLocalUserDatasourceImpl());

  return SingInFormNotifier(
    currentUserDataNotifier: currentUserDataNotifier,
    localUserRepository: localUserRepository
  );
});


class SingInFormNotifier extends StateNotifier<SingInFormState> {

  final CurrentUserDataNotifier currentUserDataNotifier;
  final LocalUserRepositoryImpl localUserRepository;

  SingInFormNotifier({
    required this.currentUserDataNotifier,
    required this.localUserRepository
  }) : super(const SingInFormState());

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
  void onPressedRemember() {
    state = state.copyWith(
      isRemember: !state.isRemember
    );
  }

  Future<void> onPressedLogIn({
    required String unCompletedFieldsMessage,
    required String authError
  }) async {
    if(
      state.email.isEmpty ||
      state.password.isEmpty
    ) {
      throw CustomError(unCompletedFieldsMessage);
    }

    final user = await localUserRepository.singIn(
      state.email,
      state.password
    );

    if(user != null) {
      currentUserDataNotifier.setUser(user);
      return;
    }

    throw CustomError(authError);
  }
}

class SingInFormState {

  final bool isLoading;
  final String email;
  final String password;
  final bool isRemember;

  const SingInFormState({
    this.isLoading = false,
    this.email = '',
    this.password = '',
    this.isRemember = false
  });

  SingInFormState copyWith({
    bool? isLoading,
    String? email,
    String? password,
    bool? isRemember
  }) => SingInFormState(
    isLoading: isLoading ?? this.isLoading,
    email: email ?? this.email,
    password: password ?? this.password,
    isRemember: isRemember ?? this.isRemember
  );
}