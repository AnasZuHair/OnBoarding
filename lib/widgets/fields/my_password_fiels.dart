import 'package:flutter/material.dart';

import '../../app_styles.dart';

class MyPasswordField extends StatefulWidget {
  final Color fillColor;
  final FocusNode focusNode;
  final String? Function(String?) validator;
  const MyPasswordField({
    Key? key,
    required this.fillColor,
    required this.focusNode,
    required this.validator,
  }) : super(key: key);

  @override
  State<MyPasswordField> createState() => _MyPasswordFieldState();
}

class _MyPasswordFieldState extends State<MyPasswordField> {
  bool password = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        style: widget.focusNode.hasFocus
            ? kBodyText2.copyWith(color: kPrimaryColor)
            : kInputHintStyle,
        cursorColor: kSecondaryColor,
        obscureText: password,
        validator: (value) {
          widget.validator(value!);
        },
        textInputAction: TextInputAction.done,
        focusNode: widget.focusNode,
        decoration: InputDecoration(
          //contentPadding: const EdgeInsets.all(0),
          suffix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (password == true) {
                    password = false;
                  } else {
                    password = true;
                  }
                });
              },
              child: Text(
                'Show',
                style:
                    kBodyText3.copyWith(decoration: TextDecoration.underline),
              ),
            ),
          ),
          hintText: 'Passsword',
          hintStyle: kInputHintStyle,
          filled: true,
          fillColor: widget.fillColor,
          border: kInputBorder,
          enabledBorder: kInputBorder,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              //height: 60,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(width: 2, color: kScaffoldBackground),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                  Icons.lock_outline,
                  color: widget.focusNode.hasFocus
                      ? kPrimaryColor
                      : kSecondaryColor.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
