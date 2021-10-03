import 'package:flutter/material.dart';

import '../../../../core/domain/util/configurations/base_configs.dart';
import '../../../../core/presenter/widgets/app_scaffold_widget.dart';
import '../../domain/entities/user.dart';
import 'profile_header_widget.dart';
import 'profile_section_widget.dart';

class ProfileDisplay extends StatelessWidget {
  const ProfileDisplay({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      headerHeight: appHeight / 2.2,
      headerContent: ProfileHeader(user: user),
      sectionContent: ProfileSection(user: user),
      sectionHeight: appHeight / 2,
    );
  }
}
