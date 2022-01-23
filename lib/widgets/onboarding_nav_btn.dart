import 'package:flutter/material.dart';

import '../app_styles.dart';

class OnBoardingNavBtn extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;
  const OnBoardingNavBtn({
    Key? key,
    required this.name,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => onPressed(),
        borderRadius: BorderRadius.circular(6),
        splashColor: Colors.black12,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            name,
            style: kBodyText1,
          ),
        ));
  }
}
