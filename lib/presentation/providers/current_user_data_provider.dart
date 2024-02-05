import 'package:banca_creditos/domain/entities/user_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:banca_creditos/infraestruture/repositories/local_user_repository_impl.dart';
import 'package:banca_creditos/infraestruture/datasources/isar_and_secure_storage_local_user_datasource_impl.dart';



final currentUserDataProvider = StateNotifierProvider<CurrentUserDataNotifier, CurrentUserDataState>((ref) {
  final localUserRepository = LocalUserRepositoryImpl(IsarAndSecureStorageLocalUserDatasourceImpl());

  return CurrentUserDataNotifier(localUserRepository);
});

class CurrentUserDataNotifier extends StateNotifier<CurrentUserDataState> {

  final LocalUserRepositoryImpl localUserRepository;

  CurrentUserDataNotifier(this.localUserRepository) : super(const CurrentUserDataState());

  void setUser(UserEntity user) {
    state = state.copyWith(
      currentUser: user
    );
  }

  void saveCreditSimulation(CreditSimulationEntity simulation) {
    state = state.copyWith(
      currentUser: state.currentUser?.copyWithAddSimulation(simulation)
    );
  }
}

class CurrentUserDataState {

  final UserEntity? currentUser;

  const CurrentUserDataState({
    this.currentUser
  });

  CurrentUserDataState copyWith({
    UserEntity? currentUser
  }) => CurrentUserDataState(
    currentUser: currentUser ?? this.currentUser
  );

}