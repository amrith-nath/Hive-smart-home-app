import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/config/config.dart';
import 'package:hive/utils/utils.dart';

import '../../../bloc/bloc.dart';

class SignUptextFieldWidgets extends StatefulWidget {
  const SignUptextFieldWidgets(
      {super.key,
      required this.nameFocusNode,
      required this.emailFocusNode,
      required this.passwordFocusNode});
  final FocusNode nameFocusNode;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;
  @override
  State<SignUptextFieldWidgets> createState() => _SignUptextFieldWidgetsState();
}

class _SignUptextFieldWidgetsState extends State<SignUptextFieldWidgets> {
  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (previous, current) => previous.name != current.name,
          builder: (context, state) {
            return AuthTextFieldWidget(
              onChanged: (value) {
                context.read<AuthBloc>().add(NameChanged(name: value));
              },
              label: 'Full Name',
              focusNode: widget.nameFocusNode,
              onFieldSubmitted: (_) {},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name is required';
                } else if (value.length < 3) {
                  return 'name should contain minimum 6 letters';
                }
                return null;
              },
            );
          },
        ),
        20.vh,
        BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (previous, current) => previous.email != current.email,
          builder: (context, state) {
            return AuthTextFieldWidget(
              onChanged: (value) {
                context.read<AuthBloc>().add(EmailChanged(email: value));
              },
              label: 'Email',
              onFieldSubmitted: (_) {},
              focusNode: widget.emailFocusNode,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Email';
                } else if (!EmailValidator.validate(value)) {
                  return 'Invalid email format';
                }
                return null;
              },
            );
          },
        ),
        20.vh,
        BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (previous, current) =>
              previous.password != current.password,
          builder: (context, state) {
            return AuthTextFieldWidget(
                onChanged: (value) {
                  context
                      .read<AuthBloc>()
                      .add(PasswordChanged(password: value));
                },
                label: 'Password',
                onFieldSubmitted: (_) {},
                focusNode: widget.passwordFocusNode,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return "Password should contain minimum 6 letters or characters";
                  }
                  return null;
                },
                obscureText: obscureText,
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Icon(obscureText
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded),
                ));
          },
        ),
      ],
    );
  }
}
