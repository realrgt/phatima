import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../bloc/bloc.dart';
import '../widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _loginBloc = Modular.get<LoginBloc>();

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<LoginState>(
      stream: _loginBloc.stream,
      initialData: LoginInitial(),
      builder: (context, snapshot) {
        final state = snapshot.data;

        if (state is LoginInitial) {
          return Center(
            child: ElevatedButton.icon(
              onPressed: () => _loginBloc.sink.add(SignUserIn()),
              icon: const Icon(Icons.mail),
              label: const Text('Login'),
            ),
          );
        } else if (state is LoginLoading) {
          return const LoadingWidget();
        } else if (state is LoginLoaded) {
          Modular.to.navigate('../home/');
        } else if (state is LoginError) {
          return const Center(
            child: Text('Error'),
          );
        }

        return const Center(child: Text('Unexpected'));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: _buildBody(context),
    );
  }
}
