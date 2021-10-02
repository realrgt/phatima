import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../blocs/page_toggle/page_toggle_bloc.dart';
import '../util/menu_items.dart';

class PageToggle extends StatelessWidget {
  PageToggle({Key? key}) : super(key: key);

  final _pageToggleBloc = Modular.get<PageToggleBloc>();

  @override
  Widget build(BuildContext context) {
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
            items: [...menuItems],
          );
        },
      ),
    );
  }
}
