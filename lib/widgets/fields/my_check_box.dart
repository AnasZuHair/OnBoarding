import 'package:flutter/material.dart';

import '../../app_styles.dart';

class MyChekBox extends StatefulWidget {
  final String text;
  const MyChekBox({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<MyChekBox> createState() => _MyChekBoxState();
}

class _MyChekBoxState extends State<MyChekBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            activeColor: kPrimaryColor,
            checkColor: kSecondaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            }),
        Text(
          widget.text,
          style: kBodyText3,
        )
      ],
    );
  }
}
