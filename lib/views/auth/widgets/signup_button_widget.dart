import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/bloc/bloc.dart';

import '../../../config/config.dart';
import '../../../utils/utils.dart';

class SignUpButtonWidget extends StatelessWidget {
  const SignUpButtonWidget({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (prev, current) => prev != current,
      listener: (context, state) {
        log("signUp listening");
        if (state.apiStatus == ApiStatus.success) {
          FlushbarHelperFnction.flushBarSuccessMessage(
              context: context, message: 'Welcome ${state.name.toUpperCase()}');
        }
        if (state.apiStatus == ApiStatus.error) {
          FlushbarHelperFnction.flushBarErrorMessage(
            context: context,
            message: state.message,
          );
        }
      },
      builder: (context, state) {
        return PrimaryButtonWidget(
            isLoading: state.apiStatus == ApiStatus.loading,
            width: double.infinity,
            onTap: () {
              if (formKey.currentState!.validate()) {
                context.read<AuthBloc>().add(RegisterButtonClick());
              }
            },
            label: "Create Account");
      },
    );
  }
}
