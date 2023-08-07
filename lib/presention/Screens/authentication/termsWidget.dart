import 'package:flutter/material.dart';
import 'package:untitled/presention/Screens/authentication/createAccount.dart';

import '../../../core/constant/Colors.dart';
import '../../../core/constant/Strings.dart';
import '../../../core/custom/button/buttonCustom.dart';
import '../../../core/custom/text/boldText.dart';
import 'login.dart';

class TermsWidget extends StatelessWidget {
  ScrollController? controllerScroll;
  TermsWidget({Key? key,this.controllerScroll }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title="الشروط والأحكام";
    return Stack(
      children:[
        Positioned(child:  Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            controller:controllerScroll ,
            child: Column(children: [
              Text(style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),'الشروط والأحكام'),
              SizedBox(height: 25,),

              Container(alignment: Alignment.center,child:  Text(AppText.tearms1,
                textAlign: TextAlign.center,style: TextStyle(fontSize: 15,color: Colors.black87,)
                ,),),
              SizedBox(height: 25,),
              Container(alignment: Alignment.center,child:  Text(AppText.tearm2,),),
              SizedBox(height: 25,),


              Container(alignment: Alignment.center,child:  Text( AppText.tearm3
                ,textAlign: TextAlign.center
                ,),),
              SizedBox(height: 25,),

              Container(alignment: Alignment.center,child:  Text( AppText.tearm4
                ,textAlign: TextAlign.center
                ,),),

            ],),
          ),

        )),
        PositionedDirectional(
          bottom: 0,start: 0,end: 0,
          child: Column(children: [
            CustomButtonPink(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateAccount(),
                  ),
                );
              },
              text: 'ارسال',
            ),
            SizedBox(height: 3),
            TextButton(onPressed: (){ Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateAccount(),
              ),
            );}, child: const Text("رجوع",style: TextStyle(color: Colors.pink),)),

          ],),


        )
      ],
    );

  }
}