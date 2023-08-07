import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constant/Colors.dart';

class textformfield extends StatelessWidget {

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hint;
  TextInputType? keyboardInput;
  List<TextInputFormatter>? inputFormatters;
  bool? obscureText ;
  final FormFieldValidator? validator;
  ValueChanged<String>? onChanged;
  int? maxLength;
  bool _isFocused =false;
  final TextEditingController? controller;
  GestureTapCallback? onTap;
  bool readOnly = false;


      textformfield(
      {
         this.prefixIcon,
         this.suffixIcon,
         this.hint,
         this.keyboardInput,
         this.obscureText,
         this.validator,
         this.onChanged,
        this.maxLength,
        this.controller,
        this.onTap
      });

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      keyboardType: keyboardInput,
      obscureText: obscureText??false,
      maxLength: maxLength,

      decoration: InputDecoration(
        counterText: '',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _isFocused
                ? AppColors.lightPink
                : AppColors.lightGray,
            width: 1,
          ),
        ),
        errorBorder:   OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.red,
            // Set the error border color to red
            width: 2,
          ),
        ),
        focusedErrorBorder:  OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.red,
            // Set the error border color to red
            width: 2,
          ),
        ),
        hintText: hint,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
