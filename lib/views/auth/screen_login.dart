import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/utils/utils.dart';
import '../../bloc/bloc.dart';
import '../../config/config.dart';
import 'widgets/widgets.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late AuthBloc _authBloc;
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  var obscureText = true;

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
                heading: "Sign In to your\nAccount",
                subHeading: "Use your mail and password\nto SignIn",
              ),
              Container(
                height: MediaQuery.of(context).size.height - 240,
                padding: const EdgeInsets.all(20),
                color: Colors.white,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SignInTextfields(
                          emailFocusNode: emailFocusNode,
                          passwordFocusNode: passwordFocusNode),
                      25.vh,
                      SignInButtonWidget(
                        formKey: _formKey,
                      ),
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
                          TextButtonWidget(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, RouteName.signUp);
                              },
                              label: "Register")
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
