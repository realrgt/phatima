import 'package:flutter/material.dart';

import '../../domain/util/configurations/base_configs.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key? key,
    this.headerContent,
    required this.headerHeight,
    this.sectionContent,
    required this.sectionHeight,
  }) : super(key: key);

  final Widget? headerContent;
  final Widget? sectionContent;
  final double headerHeight;
  final double sectionHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //? inner [background] container
        Container(color: const Color(0xFFE6EAF1)),
        //? middle [header] container
        Container(
          height: headerHeight,
          width: appWidth,
          decoration: const BoxDecoration(
            color: Color(0xFF130B1F),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20.0),
            ),
          ),
          child: headerContent,
        ),
        //? upper [body] container
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
              height: sectionHeight,
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              padding: appPadding,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: sectionContent),
        ),
      ],
    );
  }
}
