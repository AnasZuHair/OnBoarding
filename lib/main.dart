import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_app/app_styles.dart';
import 'package:onboarding_app/views/sign_up_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'views/auth/onboarding_page.dart';

bool? seenOnboard;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: deprecated_member_use
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SharedPreferences preferences = await SharedPreferences.getInstance();
  seenOnboard = preferences.getBool('seenOnboard') ?? false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.manropeTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: kScaffoldBackground),
      home: seenOnboard == true ? const SignUpPage() : const OnBoardingPage(),
    );
  }
}
