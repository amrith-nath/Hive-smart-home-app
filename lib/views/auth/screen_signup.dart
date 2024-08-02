import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/utils/utils.dart';

import '../../bloc/bloc.dart';
import '../../config/config.dart';
import 'widgets/widgets.dart';

class ScreenSignUp extends StatefulWidget {
  const ScreenSignUp({super.key});

  @override
  State<ScreenSignUp> createState() => _ScreenSignUpState();
}

class _ScreenSignUpState extends State<ScreenSignUp> {
  final _formKey = GlobalKey<FormState>();
  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  late AuthBloc _authBloc;

  @override
  void initState() {
    _authBloc = AuthBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.whitePrimary,
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => _authBloc,
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const AuthHeroWidget(
                heading: "Register your\nAccount",
                subHeading: "Use your mail and password\nto Register",
              ),
              Container(
                height: MediaQuery.of(context).size.height - 240,
                padding: const EdgeInsets.all(20),
                color: Colors.white,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SignUptextFieldWidgets(
                          nameFocusNode: nameFocusNode,
                          emailFocusNode: emailFocusNode,
                          passwordFocusNode: passwordFocusNode),
                      25.vh,
                      SignUpButtonWidget(formKey: _formKey),
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
      ),
    );
  }
}
