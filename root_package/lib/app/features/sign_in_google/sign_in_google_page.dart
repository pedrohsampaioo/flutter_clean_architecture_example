import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:other_package/domain/usecases/sign_in_google.dart';
import 'package:root_package/app/features/sign_in_google/cubits/sign_in_google/sign_in_google_cubit.dart';

class SignInGooglePage extends StatelessWidget {
  final signInGoogleCubit = Modular.get<SignInGoogleCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google'),
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
              onPressed: () => signInGoogleCubit.signIn(),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: BlocBuilder<SignInGoogleCubit, SignInGoogleState>(
              cubit: signInGoogleCubit,
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
