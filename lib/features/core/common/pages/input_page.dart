import 'package:flutter/material.dart';

import '../../colors.dart';
import '../widgets/input_widget.dart';
import '../widgets/save_button_widget.dart';

class InputPage extends StatelessWidget {
  final void Function(int) onSave;

  const InputPage({super.key, required this.onSave});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final color = TechnicalTestColors();

    return Scaffold(
      backgroundColor: color.mapColorsTechnicalTest['deepPurple'],
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_outlined, color: Colors.white, size: 32,),
        ),
        backgroundColor: color.mapColorsTechnicalTest['deepPurple'],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InputWidget(controller: controller),
            const SizedBox(height: 32),
            SaveButtonWidget(color: color, controller: controller, onSave: onSave),
          ],
        ),
      ),
    );
  }
}
