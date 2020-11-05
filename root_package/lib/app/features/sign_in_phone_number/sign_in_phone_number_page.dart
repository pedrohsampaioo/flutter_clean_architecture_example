import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cubits/sign_in_phone_number/sign_in_phone_number_cubit.dart';

class SignInPhoneNumberPage extends StatelessWidget {
  final signInPhoneNumberCubit = Modular.get<SignInPhoneNumberCubit>();
  final phoneNumberController =
      MaskedTextController(mask: '+55 (00) 0 0000-0000');
  final smsCodeController = MaskedTextController(mask: '000000');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Number'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: BlocBuilder<SignInPhoneNumberCubit, SignInPhoneNumberState>(
          cubit: signInPhoneNumberCubit,
          builder: (_, state) {
            final failure = state.failure.fold<String>(
              () => 'No Failure',
              (failure) => failure.toString(),
            );
            final user = state.user.fold<String>(
              () => 'No user',
              (user) => 'User id: ${user.uid}',
            );
            final verificationId = state.verificationIdEntity.fold<String>(
              () => 'No verification id',
              (verficationId) => 'Verification id: ${verficationId.id}',
            );
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: phoneNumberController,
                      ),
                    ),
                  ),
                  Center(
                    child: RaisedButton(
                      onPressed: () =>
                          signInPhoneNumberCubit.sendVerificationCode(
                        phoneNumberController.text,
                      ),
                      child: Text('Send code'),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: smsCodeController,
                      ),
                    ),
                  ),
                  Center(
                    child: RaisedButton(
                      onPressed: () => signInPhoneNumberCubit.signIn(
                        smsCodeController.text,
                      ),
                      child: Text('verify sms code'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(failure),
                  const SizedBox(height: 16),
                  Text(user),
                  const SizedBox(height: 16),
                  Text('Load In Progress: ${state.loadInProgress}'),
                  const SizedBox(height: 16),
                  Text(verificationId),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
