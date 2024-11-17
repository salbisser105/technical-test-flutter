
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/pages/input_page.dart';
import '../../cubit/points_cubit.dart';
import 'floating_action_button_widget.dart';

class FloatingActionContentWidget extends StatelessWidget {
  const FloatingActionContentWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButtonWidget(
          icon: Icons.add,
          heroTag: 'add',
          onPressed: () {
            Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => InputPage(
            onSave: (value) {
              context.read<PointsCubit>().addPoints(value);
            },
          ),
        ),
      );
          },
        ),
        const SizedBox(height: 16),
        FloatingActionButtonWidget(
          icon: Icons.remove,
          heroTag: 'subtract',
          onPressed: () {
            Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => InputPage(
            onSave: (value) {
              context.read<PointsCubit>().subtractPoints(value);
            },
          ),
        ),
      );
          },
        ),
        
      ],
    );
  }
}
