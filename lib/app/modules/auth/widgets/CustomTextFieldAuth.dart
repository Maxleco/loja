import 'package:flutter/material.dart';
import 'package:loja/app/modules/auth/utils/StylesTexts.dart';

class CustomTextFieldAuth extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType textInputType;
  final IconData icon;
  final String hint;
  final bool isPass;

  const CustomTextFieldAuth({   
    @required this.controller, 
    @required this.icon,
    @required this.label,
    this.hint,
    this.textInputType = TextInputType.text,
    this.isPass = false, 
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          this.label,
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: this.controller,
            obscureText: this.isPass,
            keyboardType: this.textInputType,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "OpenSans",
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                this.icon,
                color: Colors.white,
              ),
              hintText: this.hint,
              hintStyle: kHintTextStyle
            ),
          ),
        ),
      ],
    );
  }
}
