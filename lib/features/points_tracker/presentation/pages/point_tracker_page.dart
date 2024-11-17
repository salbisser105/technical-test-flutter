import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/colors.dart';
import '../cubit/points_cubit.dart';
import '../widgets/floating_actions/floating_action_content_widget.dart';

class PointTrackerPage extends StatelessWidget {
  const PointTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final color = TechnicalTestColors();

    return Scaffold(
      body: BlocBuilder<PointsCubit, PointsState>(
        builder: (context, state) {
          return SafeArea(
            top: true,
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/grape.png',
                      width: size.width,
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Grape Platinium Card',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '${state.currentPoints} pts',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      height: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: color.mapColorsTechnicalTest['deepPurple'],
                      ),
                    ),
                    const SizedBox(height: 36),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        itemCount: state.updates.length,
                        itemBuilder: (context, index) {
                          final update = state.updates[index];
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${update["points"]} pts'),
                              Text(
                                '${update["date"]}', 
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: const FloatingActionContentWidget(),
    );
  }
}
