import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:untitled/presention/Screens/authentication/ChangePassword.dart';
import 'package:untitled/presention/Screens/authentication/login.dart';

import '../../../core/constant/Colors.dart';
import '../../../core/constant/ImagesPath.dart';
import '../../../core/constant/Strings.dart';
import '../../../core/custom/button/buttonCustom.dart';
import '../../../core/custom/text/boldText.dart';

class ConfirmAccount extends StatefulWidget {
  const ConfirmAccount({Key? key}) : super(key: key);

  @override
  State<ConfirmAccount> createState() => _ConfirmAccountState();
}

class _ConfirmAccountState extends State<ConfirmAccount> {
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
                  text: AppText.ActivateAccount,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                SizedBox(
                  height: 25,
                ),
                PinCodeTextField(
                  appContext: context,
                  length: 4, // Set the length of the code
                  onChanged: (value) {
                    // Handle code changes
                    print('Code changed: $value');
                  },
                  onCompleted: (value) {
                    // Handle code submission
                    print('Code submitted: $value');
                  },
                  // Customize the appearance of the input field
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 80,
                    fieldWidth: 80,
                    activeFillColor: Colors.white,
                    activeColor: Colors.blue,
                    selectedColor: Colors.blue,
                    inactiveColor: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Column(
                  children: [
                    CustomText(
                      text: AppText.ActivateAccountMsg,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    SizedBox(height: 30,),
                    CustomButtonPink(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangePassword(),
                          ),
                        );
                      },
                      text: 'تاكيد',
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
                )
              ],
            ),
          ),
        ));
  }
}
