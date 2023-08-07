

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/core/constant/ImagesPath.dart';
import 'package:untitled/core/custom/textField/textformfield.dart';

import '../../../core/constant/Colors.dart';
import '../../../core/constant/Strings.dart';
import '../../../core/custom/button/buttonCustom.dart';
import '../../../core/custom/text/boldText.dart';


class ChangePassword extends StatefulWidget{
  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController textEditingController = TextEditingController();
  String _inputText = '';
  bool _isFocused = false;
  String? _textFieldValue;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      print('Form is valid. Value: $_textFieldValue');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.white,
        body: SingleChildScrollView(
          child: Center (
            child: Column(
                children: [
                  SizedBox(height: 60,),
                  Image.asset(ImagesPath.splashImage , width: 200, height: 200,),
                  SizedBox(height: 30,),

                  Form( key: _formKey,
                    child:

                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 28),

                          child: CustomText(text:AppText.changePass, fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left:15.0,right: 15.0),
                          child:    textformfield(
                          keyboardInput: TextInputType.visiblePassword,
                          validator: (v) {
                            if (v == null || v.isEmpty) {
                              return AppText.validateWrongTxt;
                            }else if(v.length < 8){
                              return AppText.validateWrongpass;
                            }else{
                              return null;
                            }
                          },
                          onChanged: (value) {
                            _textFieldValue = value;
                            setState(() {
                              _inputText = value;
                              _isFocused = true;
                            });
                          }, controller: textEditingController, hint:AppText.passTxtFeild, prefixIcon: Icon(Icons.lock_open_sharp),
                        ),
                        ),
                        const SizedBox(height:20),

                        Padding(
                          padding: const EdgeInsets.only(left:15.0,right: 15.0),
                          child:    textformfield(
                            keyboardInput: TextInputType.visiblePassword,
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return AppText.validateWrongTxt;
                              }else if(v.length < 8){
                                return AppText.validateWrongpass;
                              }else{
                                return null;
                              }
                            },
                            onChanged: (value) {
                              _textFieldValue = value;
                              setState(() {
                                _inputText = value;
                                _isFocused = true;
                              });
                            }, controller: textEditingController, hint:AppText.passTxtFeild, prefixIcon: Icon(Icons.lock_open_sharp),
                          ),
                        ),
                        const SizedBox(height: 20,),

                        Padding(
                          padding: const EdgeInsets.only(left:15.0,right: 15.0),
                          child:    textformfield(
                            keyboardInput: TextInputType.visiblePassword,
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return AppText.validateWrongTxt;
                              }else if(v.length < 8){
                                return AppText.validateWrongpass;
                              }else{
                                return null;
                              }
                            },
                            onChanged: (value) {
                              _textFieldValue = value;
                              setState(() {
                                _inputText = value;
                                _isFocused = true;
                              });
                            }, controller: textEditingController, hint:AppText.passTxtFeild, prefixIcon: Icon(Icons.lock_open_sharp),
                          ),
                        ),
                        const SizedBox(height: 50,),
                        CustomButtonPink(text: AppText.confirm, onPressed: _submitForm)

                      ],
                    ),




                  ), ]),
          ),
        )
    );
  }
}