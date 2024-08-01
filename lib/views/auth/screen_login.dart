import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:hive/config/components/auth_textfield_widget.dart';
import 'package:hive/config/components/primary_button_widget.dart';
import 'package:hive/config/components/textbutton_widget.dart';
import 'package:hive/config/extensions/size_extensions.dart';

import '../../config/colors/colors.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.darkPrimary,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 230,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: KColors.darkPrimary,
              ),
              child: Column(
                // mainAxisSize: MainAxisSize.min,

                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        "Sign In to your\nAccount",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: KColors.textActive),
                      ),
                    ],
                  ),
                  10.vh,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Use your mail and\npassword to SignIn",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontSize: 20, color: KColors.textSubActive),
                      ),
                      // Spacer(),

                      // Spacer(),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 240,
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    AuthTextFieldWidget(
                      label: 'Email',
                      controller: emailController,
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
                    25.vh,
                    PrimaryButtonWidget(
                        width: double.infinity, onTap: () {}, label: "Sign In"),
                    25.vh,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // const Spacer(),
                        Text(
                          "Dont have an Account yet? ",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontSize: 14,
                                color: KColors.textInactive,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        10.vw,
                        TextButtonWidget(onTap: () {}, label: "SignUp")
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
