import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orchard_tek_technical_test/features/core/common/pages/input_page.dart';
import 'package:orchard_tek_technical_test/features/points_tracker/presentation/cubit/points_cubit.dart';
import 'package:orchard_tek_technical_test/features/points_tracker/presentation/pages/point_tracker_page.dart';

void main() {
  group('PointTrackerPage Widget Tests', () {
    late PointsCubit pointsCubit;

    setUp(() {
      pointsCubit = PointsCubit();
    });

    // Helper function to pump the widget with PointsCubit
    Widget createWidgetUnderTest() {
      return BlocProvider.value(
        value: pointsCubit,
        child: const MaterialApp(
          home: PointTrackerPage(),
        ),
      );
    }

    testWidgets('displays the current points', (tester) async {
      // Given
      const initialPoints = 0;

      // When
      await tester.pumpWidget(createWidgetUnderTest());

      // Then
      expect(find.text('$initialPoints pts'), findsOneWidget);
    });

    testWidgets('displays the list of updates correctly', (tester) async {
      // Given
      final pointsUpdates = [
        {'points': '+10', 'date': '17 Nov'},
        {'points': '-5', 'date': '18 Nov'},
      ];

      // When
      await tester.pumpWidget(createWidgetUnderTest());

      // Simulate state change
      pointsCubit.emit(PointsState(
        currentPoints: 5,
        updates: pointsUpdates,
      ));
      await tester.pump();

      // Then
      for (var update in pointsUpdates) {
        expect(find.text('${update["points"]} pts'), findsOneWidget);
        expect(find.text('${update["date"]}'), findsOneWidget);
      }
    });

    testWidgets('displays the floating action buttons', (tester) async {
      // When
      await tester.pumpWidget(createWidgetUnderTest());

      // Then
      final addButton = find.byWidgetPredicate(
        (widget) =>
            widget is FloatingActionButton &&
            widget.heroTag == 'add',
      );
      final subtractButton = find.byWidgetPredicate(
        (widget) =>
            widget is FloatingActionButton &&
            widget.heroTag == 'subtract',
      );

      expect(addButton, findsOneWidget);
      expect(subtractButton, findsOneWidget);
    });

    testWidgets('tapping add floating action button navigates to InputPage', (tester) async {
      // When
      await tester.pumpWidget(createWidgetUnderTest());

      // Tap on the floating action button with heroTag 'add'
      await tester.tap(find.byWidgetPredicate(
        (widget) =>
            widget is FloatingActionButton &&
            widget.heroTag == 'add',
      ));
      await tester.pumpAndSettle();

      // Then
      expect(find.byType(InputPage), findsOneWidget);
    });

    testWidgets('tapping subtract floating action button navigates to InputPage', (tester) async {
      // When
      await tester.pumpWidget(createWidgetUnderTest());

      // Tap on the floating action button with heroTag 'subtract'
      await tester.tap(find.byWidgetPredicate(
        (widget) =>
            widget is FloatingActionButton &&
            widget.heroTag == 'subtract',
      ));
      await tester.pumpAndSettle();

      // Then
      expect(find.byType(InputPage), findsOneWidget);
    });
  });
}
