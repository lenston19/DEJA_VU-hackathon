import 'package:flutter/material.dart';
import 'colors.dart';

class CustomTextField extends StatefulWidget {
  TextEditingController controller;
  bool readOnly;
  bool enabled;
  String labelText;
  IconData icon;
  bool obscureText;
  CustomTextField(
      {this.controller,
      this.readOnly = false,
      this.enabled = true,
      this.labelText,
      this.icon,
      this.obscureText = false});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (String val) {
        if (val.isEmpty) {
          return 'Поле не должно быть пустым!';
        }
        return null;
      },
      readOnly: widget.readOnly,
      enabled: widget.enabled,
      decoration: InputDecoration(
        prefixIcon: Container(
          width: 70.0,
          padding: EdgeInsets.only(left: 14.0),
          child: Icon(
            widget.icon,
            color: cMain,
          ),
        ),
        labelText: widget.labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(
            width: 2.0,
            color: cMain,
          ),
        ),
      ),
      obscureText: widget.obscureText,
    );
  }
}
