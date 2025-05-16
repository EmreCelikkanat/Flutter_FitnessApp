import 'package:fitness_app/common/colo_extension.dart';
import 'package:flutter/material.dart';

class StatColumn extends StatelessWidget {
  IconData icon;
  String label;
  String value;

  StatColumn({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: TColor.gray),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: TColor.gray)),
        Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
