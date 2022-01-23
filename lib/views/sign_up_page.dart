import 'package:flutter/material.dart';
import 'package:onboarding_app/app_styles.dart';
import 'package:onboarding_app/size_configs.dart';
import 'package:onboarding_app/validators.dart';
import 'package:onboarding_app/views/auth/login_page.dart';
import 'package:onboarding_app/widgets/buttons/large_icon_button.dart';
import 'package:onboarding_app/widgets/buttons/small_text_button.dart';
import 'package:onboarding_app/widgets/fields/my_check_box.dart';
import 'package:onboarding_app/widgets/fields/my_password_fiels.dart';
import 'package:onboarding_app/widgets/fields/my_text+from_field.dart';
import 'package:onboarding_app/widgets/buttons/my_text_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  void onSumit() {
    _globalKey.currentState!.validate();
  }

  List<FocusNode> _SignIpFocusNode = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    super.initState();
    _SignIpFocusNode.forEach((element) {
      element.addListener(() {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.blockSizeV!;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                child:
                    Image.asset('assets/images/auth/signup_illustration.png'),
              ),
              SizedBox(
                height: height * 1,
              ),
              Text(
                'Create Your Account',
                style: kTitle2,
              ),
              SizedBox(
                height: height * 1,
              ),
              Form(
                key: _globalKey,
                child: Column(
                  children: [
                    MyTextFromField(
                      fillColor: Colors.white,
                      hint: 'Name',
                      icon: Icons.person,
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.name,
                      focusNode: _SignIpFocusNode[0],
                      validator: namevaildator,
                    ),
                    MyTextFromField(
                      fillColor: Colors.white,
                      hint: 'Email',
                      icon: Icons.email,
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.emailAddress,
                      focusNode: _SignIpFocusNode[1],
                      validator: emailValidator,
                    ),
                    MyPasswordField(
                      validator: passwordValidator,
                      fillColor: Colors.white,
                      focusNode: _SignIpFocusNode[2],
                    ),
                    MyChekBox(
                      text: 'Keep me Signed in ',
                    ),
                    MyChekBox(
                      text: 'Email me about special pricing and more',
                    ),
                    MyTextButton(
                        buttoName: 'Craete Account',
                        onPressed: () {
                          onSumit();
                        },
                        bgColor: kPrimaryColor),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        height: 3,
                        color: kSecondaryColor.withOpacity(0.4),
                      ),
                    ),
                    Text(
                      'Or sign in with',
                      style: kBodyText3,
                    ),
                    Expanded(
                      child: Divider(
                        height: 3,
                        color: kSecondaryColor.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: LargeIconButton(
                      image: 'assets/images/auth/google_icon.png',
                      text: 'Google',
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: LargeIconButton(
                      image: 'assets/images/auth/facebook_icon.png',
                      text: 'Facebook',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: kBodyText3,
                  ),
                  SmallTextButton(
                    buttonText: 'Sign in',
                    page: LoginPage(),
                  )
                ],
              ),
              SizedBox(
                height: height * 3,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
