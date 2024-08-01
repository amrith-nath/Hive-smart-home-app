import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../config/config.dart';

class ScreenSignUp extends StatefulWidget {
  const ScreenSignUp({super.key});

  @override
  State<ScreenSignUp> createState() => _ScreenSignUpState();
}

class _ScreenSignUpState extends State<ScreenSignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.whitePrimary,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: KTags.primaryHeroTag,
              child: Container(
                clipBehavior: Clip.hardEdge,
                height: 230,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: KColors.whiteSecondary,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    image: DecorationImage(
                      image: AssetImage("assets/images/head_bg.jpg"),
                      scale: 3,
                      fit: BoxFit.fill,
                      opacity: 0.8,
                    )),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,

                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Register your\nAccount",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                color: KColors.textMain,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                    10.vh,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.login,
                          color: KColors.textSecondary,
                        ),

                        10.vw,
                        Text(
                          "Use your mail and password\nto Register",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontSize: 16,
                                color: KColors.textSecondary,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        // Spacer(),

                        // Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 240,
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    AuthTextFieldWidget(
                      label: 'Full Name',
                      controller: nameController,
                      focusNode: nameFocusNode,
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
                      focusNode: emailFocusNode,
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
                        focusNode: passwordFocusNode,
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
                    25.vh,
                    PrimaryButtonWidget(
                        width: double.infinity,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        label: "Register"),
                    25.vh,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // const Spacer(),
                        Text(
                          "Already have an account ? ",
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
                        TextButtonWidget(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, RouteName.login);
                            },
                            label: "SignIn")
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
