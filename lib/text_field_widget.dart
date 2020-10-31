import 'package:flutter/material.dart';
import 'colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final bool obscureText;
  CustomTextField({this.controller, this.labelText, this.icon, this.obscureText = false});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
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
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0)
        ),
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