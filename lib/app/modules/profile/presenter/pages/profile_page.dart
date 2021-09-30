import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/domain/util/configurations/base_configs.dart';
import '../../../auth/presenter/widgets/widgets.dart';
import '../bloc/bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _profileBloc = Modular.get<ProfileBloc>();

  @override
  void initState() {
    _profileBloc.sink
        .add(const EnteredProfileTab(uid: 'pJHtcgbTvaYLaTDAWautgZixZRU2'));
    super.initState();
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: StreamBuilder<ProfileState>(
        stream: _profileBloc.stream,
        initialData: ProfileInitial(),
        builder: (context, snapshot) {
          final state = snapshot.data;

          if (state is ProfileLoading) {
            return const LoadingWidget();
          } else if (state is ProfileLoaded) {
            return Stack(
              children: <Widget>[
                //? inner [background] container
                Container(color: const Color(0xFFE6EAF1)),
                //? middle [header] container
                Container(
                  height: appHeight / 2.2,
                  width: appWidth,
                  decoration: const BoxDecoration(
                    color: Color(0xFF130B1F),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 30.0),
                      const Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 24.0,
                        ),
                      ),
                      const SizedBox(height: 50.0),
                      CircleAvatar(
                        radius: 60.0,
                        foregroundImage: NetworkImage(state.user!.photoURL),
                        backgroundColor: Colors.grey,
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        state.user!.email,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
                //? upper [body] container
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    height: appHeight / 2,
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    padding: appPadding,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.save,
                              color: Color(0xFF130B1F),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          state.user!.uid,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          initialValue: state.user!.displayName,
                          decoration: const InputDecoration(
                            hintText: 'Name',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF130B1F),
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                          initialValue: state.user!.phone,
                          decoration: const InputDecoration(
                            hintText: 'Telefone',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF130B1F),
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                          initialValue: state.user!.address,
                          decoration: const InputDecoration(
                            hintText: 'Address',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF130B1F),
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (state is ProfileError) {
            return Center(child: Text(state.errorMsg!));
          }
          return const Center(child: Text('Unnexpected Error'));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }
}
