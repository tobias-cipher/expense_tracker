import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTab extends StatelessWidget {
  final String label;
  final int index;
  final int currentIndex;
  final bool isLeft;
  final List<Color> activeGradient;
  final List<Color> inactiveGradient;
  final Color activeColor;
  final Color inactiveColor;

  const CustomTab({
    super.key,
    required this.label,
    required this.index,
    required this.currentIndex,
    this.isLeft = false,
    required this.activeGradient,
    required this.inactiveGradient,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = index == currentIndex;
    return Tab(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isSelected ? activeGradient : inactiveGradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          color: isSelected ? activeColor : inactiveColor,
          borderRadius: BorderRadius.horizontal(
            left: isLeft ? Radius.circular(10.r) : Radius.zero,
            right: isLeft ? Radius.zero : Radius.circular(10.r),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
