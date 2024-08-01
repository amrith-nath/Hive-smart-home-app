import 'package:flutter/material.dart';
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
                          "Sign In to your\nAccount",
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
                        Icon(
                          Icons.login,
                          color: KColors.textSecondary,
                        ),

                        10.vw,
                        Text(
                          "Use your mail and password\nto SignIn",
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
                    SignInTextfields(
                        emailFocusNode: emailFocusNode,
                        passwordFocusNode: passwordFocusNode),
                    25.vh,
                    PrimaryButtonWidget(
                        width: double.infinity,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        label: "Sign In"),
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
    );
  }
}
