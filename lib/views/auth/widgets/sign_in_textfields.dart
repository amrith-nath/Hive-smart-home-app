import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../../config/config.dart';

class SignInTextfields extends StatefulWidget {
  const SignInTextfields(
      {super.key,
      required this.emailFocusNode,
      required this.passwordFocusNode});

  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;

  @override
  State<SignInTextfields> createState() => _SignInTextfieldsState();
}

class _SignInTextfieldsState extends State<SignInTextfields> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AuthTextFieldWidget(
          label: 'Email',
          controller: emailController,
          onFieldSubmitted: (_) {},
          focusNode: widget.emailFocusNode,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your username';
            } else if (!EmailValidator.validate(value)) {
              return 'Invalid email format';
            }
            return null;
          },
        ),
        20.vh,
        AuthTextFieldWidget(
            label: 'Password',
            controller: passwordController,
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
            )),
      ],
    );
  }
}
