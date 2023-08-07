import 'package:flutter/material.dart';

class textFieldCustom extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Widget prefixIcon;

  Function()? validation;

   textFieldCustom({required this.controller,required this.hint, required this.prefixIcon,this.validation});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        style: TextStyle(
        // Define the text color of the input text
        color: Colors.black,
        fontSize: 16,
    ),
    decoration: InputDecoration(
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFF59AA9)),
      ),
    // Define the hint text and icon for the input field
    hintText: hint,
    prefixIcon: prefixIcon ,
    hintStyle: TextStyle(
    color: Colors.black,// Define the hint text color
    ),
    ),);
  }
}
