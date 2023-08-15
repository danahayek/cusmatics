import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/core/custom/text/boldText.dart';
import 'package:untitled/presention/Screens/authentication/termsWidget.dart';

import '../../../core/constant/Colors.dart';
import '../../../core/constant/ImagesPath.dart';
import '../../../core/constant/Strings.dart';
import '../../../core/custom/button/buttonCustom.dart';
import '../../../core/custom/textField/textFildCustom.dart';
import '../../../core/custom/textField/textformfield.dart';
import 'forgetPassword.dart';
import 'package:flutter/services.dart';

class CreateAccount extends StatefulWidget {
  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _textEditingController1 = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();
  final TextEditingController _textEditingController3 = TextEditingController();
  final TextEditingController _textEditingController4 = TextEditingController();
  final TextEditingController _textEditingController5 = TextEditingController();

  bool _isChecked = false;
  final _numberFormatter = FilteringTextInputFormatter.digitsOnly;

  String? _selectedItem;
  int selected_item = 0;
  String _email = '';


  bool _isFocused = false;
  String _inputText = '';
  bool _isObscured = true;


  bool password = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _textFieldValue; // Add the "?" to declare it as nullable

  bool _isValidMobileNumber(String value) {
    // Define the regex pattern for a valid Palestinian mobile number
    RegExp regex = RegExp(
      r'^((\+970)|(00970)|0)?(5|5[0-9]|7|7[0-9]|59|59[0-9]|59[0-9][0-9]|7[7-9]|7[7-9][0-9]|56|56[0-9]|8[8-9]|8[8-9][0-9])[0-9]{6}$',
    );
    return regex.hasMatch(value);

  }
  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // Form is valid, handle the data or perform an action
      print('Form is valid. Value: $_textFieldValue');
    }
  }

  List<String> _items = ['مصر', 'فلسطين', 'سوريا', 'لبنان', "اردن"];

  Widget _buildItemPicker() {
    return CupertinoPicker(
      itemExtent: 60.0,
      backgroundColor: CupertinoColors.white,
      onSelectedItemChanged: (index) {
        setState(() {
          selected_item = index;
        });
        print(index);
      },
      children: new List<Widget>.generate(_items.length, (index) {
        return new Center(
          child: Text(
            _items[index],
            style: TextStyle(fontSize: 22.0),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  ImagesPath.splashImage,
                  width: 140,
                  height: 140,
                ),
                CustomText(
                  text: AppText.creatAccount,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          child: textformfield(
                            controller: _textEditingController1,
                            onChanged: (value){},
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return AppText.validateWrongTxt;
                              }
                            },
                            hint: AppText.nameTxtFeild , prefixIcon: const Icon(Icons.person_3_outlined),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child:
                            textformfield(

                              onTap:() async {
                                await showModalBottomSheet<int>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return _buildItemPicker();
                                  },
                                );
                                print("$_selectedItem");
                              } ,
                              hint: AppText.flagTxtField,
                              prefixIcon: Icon(Icons.flag),
                            )

                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          child:textformfield(
                            controller: _textEditingController3,
                            maxLength: 10,
                            keyboardInput: TextInputType.phone,
                            validator: (value) {
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
                            } ,
                            hint: AppText.numTxtFeild,
                            prefixIcon: Icon(Icons.phone_android),
                          ),
                          padding:
                          const EdgeInsets.only(left:15.0,right: 15.0),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          child: textformfield(
                            controller: _textEditingController3,

                            onChanged: (value) {
                              _email = value!;
                            },
                            keyboardInput: TextInputType.emailAddress,
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return 'املا الحقل';

                              }
                            },
                              hint: AppText.emailTxtFeild,
                              prefixIcon: Icon(Icons.email),
                            ),
                          ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left:15.0,right: 15.0),

                            child: textformfield(
                              controller: _textEditingController4,
                              obscureText: _isObscured,
                              validator: (value) {
                                if (value!.isEmpty && value.length < 6) {
                                  return 'املا الحقل!';
                                }
                              },
                              onChanged: (value) {
                                _textFieldValue = value;
                              },
                              // Define the hint text and icon for the input field
                              hint: AppText.passTxtFeild,
                              prefixIcon: Icon(Icons.password) ,
                              suffixIcon:  IconButton(
                                icon: _isObscured ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscured = !_isObscured;
                                  });
                                },
                              ),
                            )
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left:15.0,right: 15.0),

                            child: textformfield(
                              controller: _textEditingController5,
                              obscureText: _isObscured,
                              validator: (value) {
                                if (value!.isEmpty && value.length < 6) {
                                  return 'املا الحقل!';
                                }
                              },
                              onChanged: (value) {
                                _textFieldValue = value;
                              },
                              // Define the hint text and icon for the input field
                              hint: AppText.passTxtFeild,
                              prefixIcon: Icon(Icons.password) ,
                              suffixIcon:  IconButton(
                                icon: _isObscured ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscured = !_isObscured;
                                  });
                                },
                              ),
                            )
                        ),
                        SizedBox(height: 15,),
                        CheckboxListTile(
                          title: Text(AppText.AcceptTearms,textAlign: TextAlign.end,),
                          value: _isChecked,
                          onChanged: (bool? value) {
                            //     customshowModalBottomSheet(TermsWidget( controllerScroll: scrollController ,));
                            showModalBottomSheet(context: context,
                                backgroundColor: AppColors.white,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder( // <-- SEE HERE
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                  ),)
                                ,builder: (BuildContext context)   =>  DraggableScrollableSheet(
                                    initialChildSize: 0.6, //set this as you want
                                    maxChildSize: 0.9, //set this as you want
                                    minChildSize: 0.5, //set this as you want
                                    expand: false,
                                    builder: (context, scrollController) {

                                      return TermsWidget( controllerScroll: scrollController ,/*onTapConfierm(value){}*/); //whatever you're returning, does not have to be a Container
                                    }
                                ));
                            setState(() {
                              _isChecked = value ?? false;
                            });},
                        ),

                      ],
                    ),
                  ),

                ),
                SizedBox(
                  height: 5,
                ),
                CustomButtonPink(
                  onPressed: _submitForm,
                  text: AppText.signup,
                ),
              ],
            ),
          ),
        ));
  }
}
