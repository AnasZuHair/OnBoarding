import 'package:flutter/material.dart';
import 'package:onboarding_app/app_styles.dart';
import 'package:onboarding_app/size_configs.dart';
import 'package:onboarding_app/validators.dart';
import 'package:onboarding_app/views/auth/login_page.dart';
import 'package:onboarding_app/widgets/buttons/my_text_button.dart';
import 'package:onboarding_app/widgets/buttons/small_text_button.dart';
import 'package:onboarding_app/widgets/fields/my_text+from_field.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
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
    double heigth = SizeConfig.blockSizeV!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          child: CircleAvatar(
            backgroundColor: kSecondaryColor.withOpacity(0.1),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: kSecondaryColor,
                icon: Icon(
                  Icons.arrow_back,
                )),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: heigth * 3,
                ),
                Center(
                  child: Text(
                    'FORGET YOUR PASSWORD?',
                    style: kTitle2,
                  ),
                ),
                SizedBox(
                  height: heigth * 2,
                ),
                Container(
                  child: Image.asset('assets/images/auth/forget.png'),
                ),
                SizedBox(
                  height: heigth * 2,
                ),
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Form(
                      key: _globalKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Enter your registered email below to receive\n                 password reste instruction',
                            style: kBodyText3,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          MyTextFromField(
                              hint: 'Email',
                              icon: Icons.email,
                              fillColor: kScaffoldBackground,
                              inputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.none,
                              focusNode: _loginFocusNode[0],
                              validator: emailValidator),
                          const SizedBox(
                            height: 20,
                          ),
                          MyTextButton(
                              buttoName: 'Send Reset link',
                              onPressed: () {
                                onSumit();
                              },
                              bgColor: kPrimaryColor),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account? "),
                              SmallTextButton(
                                buttonText: 'Login',
                                page: LoginPage(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
