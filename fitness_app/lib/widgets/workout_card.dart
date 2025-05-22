import 'package:fitness_app/common/colo_extension.dart';
import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  IconData icon;
  Color color;
  String title;
  String subtitle;

  WorkoutCard({super.key, 
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: TColor.lightGray,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 8),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(subtitle),
        ],
      ),
    );
  }
}
