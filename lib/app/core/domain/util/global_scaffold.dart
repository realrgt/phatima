import 'package:flutter/material.dart';

class GlobalScaffold {
  static final instance = GlobalScaffold();

  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late PersistentBottomSheetController bottomSheetController;
}
