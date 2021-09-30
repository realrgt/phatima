import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../blocs/page_toggle/page_toggle_bloc.dart';

class PageToggle extends StatelessWidget {
  PageToggle({Key? key}) : super(key: key);

  final _pageToggleBloc = Modular.get<PageToggleBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RouterOutlet(),
      bottomNavigationBar: StreamBuilder<int>(
        initialData: homePageIndex,
        stream: _pageToggleBloc.stream,
        builder: (context, snapshot) {
          final state = snapshot.data!;
          return SalomonBottomBar(
            currentIndex: state,
            onTap: _pageToggleBloc.setIndex,
            items: [...menuItems],
          );
        },
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
