import 'package:flutter/material.dart';
import 'package:onboarding_app/app_styles.dart';
import 'package:onboarding_app/size_configs.dart';
import 'package:onboarding_app/validators.dart';
import 'package:onboarding_app/views/auth/forget_password_page_.dart';
import 'package:onboarding_app/views/sign_up_page.dart';
import 'package:onboarding_app/widgets/buttons/large_icon_button.dart';
import 'package:onboarding_app/widgets/buttons/my_text_button.dart';
import 'package:onboarding_app/widgets/buttons/small_text_button.dart';
import 'package:onboarding_app/widgets/fields/my_password_fiels.dart';
import 'package:onboarding_app/widgets/fields/my_text+from_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  void onSumit() {
    _globalKey.currentState!.validate();
  }

  List<FocusNode> _loginFocusNode = [
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    super.initState();
    _loginFocusNode.forEach((element) {
      element.addListener(() {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double height = SizeConfig.blockSizeV!;
    return Stack(
      children: [
        Positioned(
          child: Container(
            child: Image.asset(
              'assets/images/auth/Background.png',
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              ' WELCOME TO\n MOUNMENTAL HABITS',
                              style: kTitle,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        )),
                    Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                children: [
                                  LargeIconButton(
                                    image: 'assets/images/auth/google_icon.png',
                                    text: 'Continue with Google',
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  LargeIconButton(
                                    image:
                                        'assets/images/auth/facebook_icon.png',
                                    text: 'Continue with Faecbook',
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Log in with email',
                                    style: kBodyText3,
                                  ),
                                  Divider(
                                    height: 30,
                                    color: kPrimaryColor,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Form(
                                      key: _globalKey,
                                      child: Column(
                                        children: [
                                          MyTextFromField(
                                              hint: 'Email',
                                              icon: Icons.email,
                                              fillColor: kScaffoldBackground,
                                              inputType:
                                                  TextInputType.emailAddress,
                                              inputAction: TextInputAction.next,
                                              focusNode: _loginFocusNode[0],
                                              validator: emailValidator),
                                          MyPasswordField(
                                              fillColor: kScaffoldBackground,
                                              focusNode: _loginFocusNode[1],
                                              validator: passwordValidator),
                                          MyTextButton(
                                              buttoName: 'Login',
                                              onPressed: () {
                                                onSumit();
                                              },
                                              bgColor: kPrimaryColor),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const ForgetPasswordPage()));
                                            },
                                            child: Text(
                                              'Forget Password?',
                                              style: kBodyText3.copyWith(
                                                  decoration:
                                                      TextDecoration.underline),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text("Don't have an account? "),
                                              SmallTextButton(
                                                buttonText: 'Sign up',
                                                page: SignUpPage(),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
