import 'package:flutter/material.dart';
import 'package:untitled/presention/Screens/authentication/ConfirmAccount.dart';
import 'package:untitled/presention/Screens/authentication/login.dart';

import '../../../core/constant/Colors.dart';
import '../../../core/constant/ImagesPath.dart';
import '../../../core/constant/Strings.dart';
import '../../../core/custom/button/buttonCustom.dart';
import '../../../core/custom/text/boldText.dart';
import 'package:flutter/services.dart';
import '../../../core/custom/textField/textformfield.dart';
import 'createAccount.dart';
class forgetPassword extends StatefulWidget {
  const forgetPassword({Key? key}) : super(key: key);

  @override
  State<forgetPassword> createState() => _forgetPasswordState();
}

class _forgetPasswordState extends State<forgetPassword> {
  final TextEditingController textEditingController1 = TextEditingController();

  final _numberFormatter = FilteringTextInputFormatter.digitsOnly;
  bool _isObscured = true;
  bool _isFocused=false;
  String _inputText ='';

  bool password=true;
  bool _isValidMobileNumber(String value) {
    // Define the regex pattern for a valid Palestinian mobile number
    RegExp regex = RegExp(
      r'^((\+970)|(00970)|0)?(5|5[0-9]|7|7[0-9]|59|59[0-9]|59[0-9][0-9]|7[7-9]|7[7-9][0-9]|56|56[0-9]|8[8-9]|8[8-9][0-9])[0-9]{6}$',
    );
    return regex.hasMatch(value);
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _textFieldValue; // Add the "?" to declare it as nullable

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      // Form is valid, handle the data or perform an action
      print('Form is valid. Value: $_textFieldValue');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Image.asset(
                  ImagesPath.splashImage,
                  width: 250,
                  height: 250,
                ),
                SizedBox(
                  height: 15,
                ),
                CustomText(
                  text:AppText.forgetPassword2,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                SizedBox(
                  height: 15,
                ),
                Form(
                  key: _formKey,

                  child:
                  Padding(
                    child:textformfield(
                      controller: textEditingController1,
                      maxLength: 10,
                      keyboardInput: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty &&!_isValidMobileNumber(value)) {
                          return 'املا الحقل';
                        }
                        else{
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ConfirmAccount(),
                            ),
                          );
                        }
                      },
                      onChanged: (value) {
                        _textFieldValue = value;
                        setState(() {
                          _inputText = value;
                          _isFocused = true;
                        });
                      } ,
                      hint: AppText.numTxtFeild,
                      prefixIcon: Icon(Icons.phone_android),
                    ),
                    padding:
                    const EdgeInsets.only(left:15.0,right: 15.0),
/*
                        child: TextFormField(
                          controller: textEditingController1,
                          maxLength: 10,

                          keyboardType: TextInputType.phone,
                          validator:(value) {
                            if (value == null || value.isEmpty &&!_isValidMobileNumber(value)) {
                              return 'املا الحقل';
                            }
                          },
                            onChanged: (value) {
                            _textFieldValue = value;
                            setState(() {
                            _inputText = value;
                            _isFocused = true;
                            });
                            },
                            decoration:  InputDecoration(
                            counterText:'',
                            enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: _isFocused ? AppColors.lightPink : AppColors.lightGray,
                            width: 1,),
                            ),
                            // Define the hint text and icon for the input field
                            hintText: "رقم الهاتف",
                            prefixIcon: Icon(Icons.phone_android) ,
                            errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.red, // Set the error border color to red
                                width: 2,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red, // Set the error border color to red
                                width: 2,
                              ),
                            ),
                          ),
                        ),
*/
                  ),
                ),
                SizedBox(height: 30),
                 Text(AppText.forgetPassMsg,
                      style: TextStyle(color: AppColors.black,)),

                SizedBox(height: 60),
                CustomButtonPink(
                  onPressed: _submit,
                  text: 'ارسال',
                ),
                SizedBox(height: 14),
                TextButton(onPressed: (){ Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => login(),
                  ),
                );}, child: Text("رجوع",style: TextStyle(color: AppColors.lightPink,),)),
                SizedBox(height: 16),
              ],
            ),
          ),
        ));  }
}
