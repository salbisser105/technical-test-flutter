import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orchard_tek_technical_test/features/points_tracker/presentation/pages/point_tracker_page.dart';

import 'package:intl/date_symbol_data_local.dart';

import 'features/points_tracker/presentation/cubit/points_cubit.dart';

void main()async {
    WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('es', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PointsCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PointTrackerPage(),
      ),
    );
  }
}
