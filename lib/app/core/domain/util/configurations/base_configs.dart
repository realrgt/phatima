import 'package:flutter/widgets.dart';

import '../global_scaffold.dart';

/// `returns` the global context
BuildContext get globalContext =>
    GlobalScaffold.instance.scaffoldMessengerKey.currentContext!;

/// `returns` the device's maximum width
double get appWidth => MediaQuery.of(globalContext).size.width;

/// `returns` the device's maximum height
double get appHeight => MediaQuery.of(globalContext).size.height;

/// app default padding
EdgeInsetsGeometry get appPadding =>
    const EdgeInsets.symmetric(horizontal: 16, vertical: 10);

/// app default margin
EdgeInsetsGeometry get appMargin =>
    const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
