import 'package:flutter/material.dart';

import '../../app_styles.dart';

class LargeIconButton extends StatelessWidget {
  final String image;
  final String text;
  const LargeIconButton({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        height: 30,
        child: Row(
          children: [
            Expanded(flex: 1, child: Container(child: Image.asset(image))),
            Expanded(
                flex: 2,
                child: Text(
                  text,
                  style: kBodyText3,
                )),
          ],
        ),
      ),
      style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          )),
    );
  }
}
