import 'package:fitness_app/common/colo_extension.dart';
import 'package:flutter/material.dart';

class StatColumn extends StatelessWidget {
  IconData icon;
  String label;
  String value;
  Color color;
  StatColumn({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: color)),
        Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
