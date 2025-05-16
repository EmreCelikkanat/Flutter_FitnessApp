import 'package:fitness_app/common/colo_extension.dart';
import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  IconData icon;
  Color color;
  String title;
  String subtitle;

  ExerciseCard({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: TColor.lightGray,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 36),
          const SizedBox(height: 8),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(subtitle),
        ],
      ),
    );
  }
}
