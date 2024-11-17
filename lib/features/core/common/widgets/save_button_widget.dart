
import 'package:flutter/material.dart';
import 'package:orchard_tek_technical_test/features/core/colors.dart';

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({
    super.key,
    required this.color,
    required this.controller,
    required this.onSave,
  });

  final TechnicalTestColors color;
  final TextEditingController controller;
  final void Function(int p1) onSave;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color:  color.mapColorsTechnicalTest['softPurple'],
        borderRadius: BorderRadius.circular(32), 
       
      ),
      child: ElevatedButton(
        onPressed: () {
          final value = int.tryParse(controller.text);
          if (value != null) {
            onSave(value);
            Navigator.pop(context);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, 
          shadowColor: Colors.transparent, 
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
        ),
        child: const Text(
          'SAVE',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 18), 
        ),
      ),
    );
  }
}
