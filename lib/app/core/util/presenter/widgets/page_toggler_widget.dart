import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class PageToggle extends StatelessWidget {
  const PageToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RouterOutlet(),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: 0,
        onTap: (value) {},
        items: [...menuItems],
      ),
    );
  }
}

final menuItems = [
  SalomonBottomBarItem(
    selectedColor: Colors.amberAccent,
    icon: const Icon(Icons.home, size: 30),
    title: const Text('Home'),
  ),
  SalomonBottomBarItem(
    selectedColor: Colors.blue[200],
    icon: const Icon(Icons.shopping_cart, size: 30),
    title: const Text('Orders'),
  ),
  SalomonBottomBarItem(
    selectedColor: Colors.pinkAccent[100],
    icon: const Icon(Icons.payment, size: 30),
    title: const Text('Finance'),
  ),
  SalomonBottomBarItem(
    selectedColor: Colors.pinkAccent[100],
    icon: const Icon(Icons.person, size: 30),
    title: const Text('Profile'),
  )
];
