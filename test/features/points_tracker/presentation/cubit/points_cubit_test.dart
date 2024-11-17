import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:orchard_tek_technical_test/features/core/helpers/date_helpers.dart';
import 'package:orchard_tek_technical_test/features/points_tracker/presentation/cubit/points_cubit.dart';

void main() async {
  setUpAll(() async {
    // Inicializamos los datos del locale 'es' para poder usar el formateo de fecha
    await initializeDateFormatting('es', null);
  });

  group('PointsCubit Tests', () {
    late PointsCubit pointsCubit;

    setUp(() {
      pointsCubit = PointsCubit();
    });

    tearDown(() {
      pointsCubit.close();
    });

    test('initial state is correct', () {
      expect(
        pointsCubit.state,
        const PointsState(currentPoints: 0, updates: []),
      );
    });

    blocTest<PointsCubit, PointsState>(
      'addPoints emits correct state',
      build: () => pointsCubit,
      act: (cubit) => cubit.addPoints(10),
      expect: () => [
        PointsState(
          currentPoints: 10,
          updates: [
            {
              "points": "+10",
              "date": formatDateToDayMonth(DateTime.now()), // Fecha dinámica
            }
          ],
        ),
      ],
    );

    blocTest<PointsCubit, PointsState>(
      'subtractPoints emits correct state',
      build: () => pointsCubit,
      act: (cubit) => cubit.subtractPoints(5),
      expect: () => [
        PointsState(
          currentPoints: -5,
          updates: [
            {
              "points": "-5",
              "date": formatDateToDayMonth(DateTime.now()), // Fecha dinámica
            }
          ],
        ),
      ],
    );

    blocTest<PointsCubit, PointsState>(
      'addPoints and subtractPoints update state sequentially',
      build: () => pointsCubit,
      act: (cubit) {
        cubit.addPoints(15);
        cubit.subtractPoints(10);
      },
      expect: () => [
        PointsState(
          currentPoints: 15,
          updates: [
            {
              "points": "+15",
              "date": formatDateToDayMonth(DateTime.now()), // Fecha dinámica
            }
          ],
        ),
        PointsState(
          currentPoints: 5,
          updates: [
            {
              "points": "+15",
              "date": formatDateToDayMonth(DateTime.now()), // Fecha dinámica
            },
            {
              "points": "-10",
              "date": formatDateToDayMonth(DateTime.now()), // Fecha dinámica
            },
          ],
        ),
      ],
    );
  });
}
