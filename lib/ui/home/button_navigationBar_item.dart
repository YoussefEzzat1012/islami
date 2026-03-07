import 'package:flutter/material.dart';

class ButtonNavigationbarIcon extends StatelessWidget {
  int index;
  int selectedIndex;
  String iconName;

  ButtonNavigationbarIcon({
    required this.index,
    required this.selectedIndex,
    required this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    return buildBottomNavigationTap(
      index: index,
      selectedIndex: selectedIndex,
      iconName: iconName,
    );
  }

  Widget buildBottomNavigationTap({
    required int index,
    required int selectedIndex,
    required String iconName,
  }) {
    return selectedIndex == index
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: ImageIcon(AssetImage(iconName)),
          )
        : ImageIcon(AssetImage(iconName));
  }
}
