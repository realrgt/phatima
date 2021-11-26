import 'package:equatable/equatable.dart';

import '../../theme/app_themes.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeChanged extends ThemeEvent {
  final AppTheme theme;
  const ThemeChanged({required this.theme}) : super();
}
