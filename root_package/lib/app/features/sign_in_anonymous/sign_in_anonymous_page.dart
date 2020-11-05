import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cubits/sign_in_anonymous/sign_in_anonymous_cubit.dart';

class SignInAnonymousPage extends StatelessWidget {
  final signInAnonymousCubit = Modular.get<SignInAnonymousCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anonymous'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: RaisedButton(
              onPressed: () => signInAnonymousCubit.signIn(),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: BlocBuilder<SignInAnonymousCubit, SignInAnonymousState>(
              cubit: signInAnonymousCubit,
              builder: (_, state) {
                final textShow = state.map<String>(
                  initialized: (data) => data.toString(),
                  loadInProgress: (data) => data.toString(),
                  loadSuccess: (data) => 'user: ${data.userEntity.uid}',
                  loadFailure: (data) => data.toString(),
                );
                return Text(textShow);
              },
            ),
          ),
        ],
      ),
    );
  }
}
