import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:hive/config/config.dart';

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
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AuthTextFieldWidget(
          label: 'Full Name',
          controller: nameController,
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
        ),
        20.vh,
        AuthTextFieldWidget(
          label: 'Email',
          controller: emailController,
          focusNode: widget.emailFocusNode,
          onFieldSubmitted: (_) {},
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
            focusNode: widget.passwordFocusNode,
            onFieldSubmitted: (_) {},
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
