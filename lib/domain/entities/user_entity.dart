import 'package:banca_creditos/domain/entities/type_credits_enum.dart';
import 'package:isar/isar.dart';


part 'user_entity.g.dart';
part 'credit_simulation_entity.dart';


@Collection()
class UserEntity {

  final Id isarId;
  final String fullName;
  final String id;
  final String email;
  final List<CreditSimulationEntity> creditSimulations;

  UserEntity({
    this.isarId = Isar.autoIncrement,
    required this.fullName,
    required this.id,
    required this.email,
    this.creditSimulations = const []
  });

  UserEntity copyWithAddSimulation(CreditSimulationEntity simulation) {
    final simulationList = List<CreditSimulationEntity>.from(creditSimulations);
    simulationList.add(simulation);

    return UserEntity(
      fullName: fullName,
      id: id,
      email: email,
      creditSimulations: simulationList
    );
  }
}