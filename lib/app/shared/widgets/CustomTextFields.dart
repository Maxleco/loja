import 'package:flutter/material.dart';

class CustomTextFields extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isPass;

  const CustomTextFields({this.controller, this.label, this.isPass = false});
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: this.isPass,
      controller: this.controller,
      decoration: InputDecoration(
        labelText: this.label,
      ),
    );
  }
}
