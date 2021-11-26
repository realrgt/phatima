import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../blocs/page_toggle/page_toggle_bloc.dart';

class PageToggle extends StatelessWidget {
  PageToggle({Key? key}) : super(key: key);

  final _pageToggleBloc = Modular.get<PageToggleBloc>();

  @override
  Widget build(BuildContext context) {
    final _titleStyle = Theme.of(context).textTheme.subtitle2;
    final _selectedColor = Theme.of(context).colorScheme.secondary;

    return Scaffold(
      backgroundColor: const Color(0xFFE6EAF1),
      body: RouterOutlet(),
      bottomNavigationBar: StreamBuilder<int>(
        initialData: homePageIndex,
        stream: _pageToggleBloc.stream,
        builder: (context, snapshot) {
          final state = snapshot.data!;
          return SalomonBottomBar(
            currentIndex: state,
            onTap: _pageToggleBloc.setIndex,
            items: [
              SalomonBottomBarItem(
                selectedColor: _selectedColor,
                icon: const Icon(Icons.home, size: 30),
                title: Text('Home', style: _titleStyle),
              ),
              SalomonBottomBarItem(
                selectedColor: _selectedColor,
                icon: const Icon(Icons.shopping_cart, size: 30),
                title: Text('Orders', style: _titleStyle),
              ),
              SalomonBottomBarItem(
                selectedColor: _selectedColor,
                icon: const Icon(Icons.payment, size: 30),
                title: Text('Finance', style: _titleStyle),
              ),
              SalomonBottomBarItem(
                selectedColor: _selectedColor,
                icon: const Icon(Icons.person, size: 30),
                title: Text('Profile', style: _titleStyle),
              )
            ],
          );
        },
      ),
    );
  }
}
