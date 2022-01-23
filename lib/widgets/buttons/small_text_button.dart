import 'package:flutter/material.dart';

import '../../app_styles.dart';

class SmallTextButton extends StatelessWidget {
  final String buttonText;
  final Widget page;
  const SmallTextButton({
    Key? key,
    required this.buttonText,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: kSecondaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            buttonText,
            style: kBodyText3.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
