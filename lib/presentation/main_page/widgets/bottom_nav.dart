import 'package:flutter/material.dart';

ValueNotifier<int> indexChangedNotifier = ValueNotifier(0);

class BottomNavigatonWidgets extends StatelessWidget {
  const BottomNavigatonWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChangedNotifier,
        builder: (context, int newIndex, _) {
          return BottomNavigationBar(
              showUnselectedLabels: true,
              currentIndex: newIndex,
              onTap: (index) => indexChangedNotifier.value = index,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              selectedIconTheme: const IconThemeData(color: Colors.white),
              unselectedIconTheme: const IconThemeData(color: Colors.grey),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.collections), label: 'New & Hot'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.emoji_emotions), label: 'Fast Laughs'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.download_for_offline_rounded), label: 'Downloads')
              ]);
        });
  }
}
