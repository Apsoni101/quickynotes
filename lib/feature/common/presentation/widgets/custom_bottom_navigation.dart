import 'package:flutter/material.dart';
import 'package:quicky_notes/feature/common/presentation/widgets/bottom_nav_item.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({
    required this.activeIndex,
    required this.onTap,
    super.key,
  });

  final int activeIndex;
  final void Function(int) onTap;

  @override
  Widget build(final BuildContext context) => BottomAppBar(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        BottomNavItem(
          icon: Icons.note,
          index: 0,
          isActive: activeIndex == 0,
          onTap: onTap,
        ),
        BottomNavItem(
          icon: Icons.settings,
          index: 1,
          isActive: activeIndex == 1,
          onTap: onTap,
        ),
      ],
    ),
  );
}
