import 'package:flutter/material.dart';

import '../../app_styles.dart';
import '../../size_configs.dart';

class MyTextButton extends StatelessWidget {
  final String buttoName;
  final VoidCallback onPressed;
  final Color bgColor;
  const MyTextButton({
    Key? key,
    required this.buttoName,
    required this.onPressed,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: SizedBox(
        height: SizeConfig.blockSizeH! * 15.5,
        width: SizeConfig.blockSizeH! * 100,
        child: TextButton(
            onPressed: () {
              onPressed();
            },
            child: Text(
              buttoName,
              style: kBodyText1,
            ),
            style: TextButton.styleFrom(
                backgroundColor: bgColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)))),
      ),
    );
  }
}
