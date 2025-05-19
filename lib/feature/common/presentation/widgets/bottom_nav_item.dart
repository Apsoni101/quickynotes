import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    required this.icon,
    required this.index,
    required this.isActive,
    required this.onTap,
    super.key,
  });

  final IconData icon;
  final int index;
  final bool isActive;
  final void Function(int) onTap;

  @override
  Widget build(final BuildContext context) {
    final Color color =
        isActive
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.secondary;
    return InkWell(
      onTap: () => onTap(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Icon(icon, color: color, size: 24),
      ),
    );
  }
}
