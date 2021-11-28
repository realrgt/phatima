import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/data/util/constants/firebase.dart';
import '../../../../core/presenter/widgets/widgets.dart';
import '../bloc/bloc.dart';
import '../widgets/profile_display_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _profileBloc = Modular.get<ProfileBloc>();

  @override
  void initState() {
    _profileBloc.sink.add(EnteredProfileTab(uid: userId));
    super.initState();
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<ProfileState>(
      stream: _profileBloc.stream,
      initialData: ProfileInitial(),
      builder: (context, snapshot) {
        final state = snapshot.data;

        if (state is ProfileLoading) {
          return const LoadingWidget();
        } else if (state is ProfileLoaded) {
          return ProfileDisplay(user: state.user!);
        } else if (state is ProfileError) {
          return Center(child: Text(state.errorMsg!));
        }
        return const Center(child: Text('Unnexpected Error'));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }
}
