import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  Widget _buildBody(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () => print('Test'),
        icon: const Icon(Icons.mail),
        label: const Text('Login'),
      ),
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
