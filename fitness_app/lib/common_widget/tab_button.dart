import 'package:fitness_app/common/colo_extension.dart';
import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String icon;
  final String selectIcon;
  final VoidCallback onTap;
  final bool isActive;
  const TabButton({
    super.key,
    required this.icon,
    required this.selectIcon,
    required this.onTap,
    required this.isActive,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(isActive ? selectIcon : icon, width: 25, height: 25),
          const SizedBox(height: 8),
          Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: TColor.secondaryG),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}
