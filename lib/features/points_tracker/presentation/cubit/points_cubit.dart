import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orchard_tek_technical_test/features/core/helpers/date_helpers.dart';

part 'points_cubit.freezed.dart';
part 'points_state.dart';

class PointsCubit extends Cubit<PointsState> {
  PointsCubit() : super(const PointsState());


  void addPoints(int value) {
    final updatedPoints = state.currentPoints + value;
    final update = {
      "points": "+$value",
      "date": formatDateToDayMonth(DateTime.now()) // Usamos el método de formato
    };

    emit(state.copyWith(
      currentPoints: updatedPoints,
      updates: [...state.updates, update],
    ));
  }

  void subtractPoints(int value) {
    final updatedPoints = state.currentPoints - value;
    final update = {
      "points": "-$value",
      "date": formatDateToDayMonth(DateTime.now()) // Usamos el método de formato
    };

    emit(state.copyWith(
      currentPoints: updatedPoints,
      updates: [...state.updates, update],
    ));
  }
}
