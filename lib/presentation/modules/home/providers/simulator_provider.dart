import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:banca_creditos/domain/entities/type_credits_enum.dart';
import 'package:banca_creditos/infraestruture/utils/AppExceptions.dart';
import 'package:banca_creditos/presentation/modules/home/utils/input_formatters.dart';



final simulatorProvider = StateNotifierProvider<SimulatorNotifier, SimulatorState>((ref) {
  return SimulatorNotifier();
});

class SimulatorNotifier extends StateNotifier<SimulatorState> {

  final calculateCreditController = TextEditingController();

  SimulatorNotifier() : super(const SimulatorState());

  void onChangedTypeCredits(TypeCreditsEnum typeCredit) {
    state = state.copyWith(
      typeCredit: typeCredit
    );
  }
  void onChangedSalary(String salary) {
    String numberString = salary.replaceAll(RegExp(r'[^0-9.]'), '');

    state = state.copyWith(
      salary: double.tryParse(numberString)
    );
    calculateCredit();
  }
  void onChangedNumberOfMonths(String numberOfMonths) {
    state = state.copyWith(
      numberOfMonths: int.tryParse(numberOfMonths)
    );
  }

  void calculateCredit() {
    if(state.salary == null) {
      return;
    }

    final value = (state.salary! * 7) ~/ 0.15;
    calculateCreditController.text = CurrencyInputFormatter.format((value).toString());
    state = state.copyWith(
      calculateCreditValue: value
    );
  }



  void simulateCredit({
    required String unCompletedFieldsMessage,
    required String monthsOutOfRangeMessage
  }) {
    if(
      state.typeCredit == null ||
      state.salary == null ||
      state.numberOfMonths == null
    ) {
      throw CustomError(unCompletedFieldsMessage);
    }

    if(state.numberOfMonths! < 12 || state.numberOfMonths! > 84) {
      throw CustomError(monthsOutOfRangeMessage);
    }

    calculateCreditController.text = '';
  }
}


class SimulatorState {

  final TypeCreditsEnum? typeCredit;
  final double? salary;
  final int? numberOfMonths;
  final int calculateCreditValue;

  const SimulatorState({
    this.typeCredit,
    this.salary,
    this.numberOfMonths,
    this.calculateCreditValue = 0
  });

  SimulatorState copyWith({
    TypeCreditsEnum? typeCredit,
    double? salary,
    int? numberOfMonths,
    int? calculateCreditValue
  }) => SimulatorState(
    typeCredit: typeCredit ?? this.typeCredit,
    salary: salary ?? this.salary,
    numberOfMonths: numberOfMonths ?? this.numberOfMonths,
    calculateCreditValue: calculateCreditValue ?? this.calculateCreditValue
  );
}