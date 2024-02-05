import 'package:banca_creditos/domain/entities/type_credits_enum.dart';
import 'package:isar/isar.dart';


part 'user_entity.g.dart';
part 'credit_simulation.dart';


@Collection()
class UserEntity {

  final Id isarId;
  final String fullName;
  final String id;
  final String email;
  final List<CreditSimulation> creditSimulations;

  UserEntity({
    this.isarId = Isar.autoIncrement,
    required this.fullName,
    required this.id,
    required this.email,
    this.creditSimulations = const []
  });

  UserEntity copyWithAddSimulation(CreditSimulation simulation) {
    final simulationList = List<CreditSimulation>.from(creditSimulations);
    simulationList.add(simulation);

    return UserEntity(
      fullName: fullName,
      id: id,
      email: email,
      creditSimulations: simulationList
    );
  }
}