import 'package:flutter/material.dart';

class BottomNav extends BottomNavigationBar {
  BottomNav({
    Key? key,
    void Function(int)? onTap,
    int currentIndex = 0,
  }) : super(
          key: key,
          onTap: onTap,
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'liked'),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.settings), label: 'settings'),
          ],
        );
}
