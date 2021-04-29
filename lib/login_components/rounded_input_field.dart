import 'package:flutter/material.dart';
import 'package:DamiStyle/login_components/text_field_container.dart';
import 'package:DamiStyle/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.phone,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
