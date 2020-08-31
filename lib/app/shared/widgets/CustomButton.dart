import 'package:flutter/material.dart';
import 'package:loja/app/shared/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color textColor;

  const CustomButton({
    this.onPressed,
    this.text,
    this.textColor = Colors.black87,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: PRIMARY_COLOR,
      onPressed: this.onPressed,
      child: Text(
        this.text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
