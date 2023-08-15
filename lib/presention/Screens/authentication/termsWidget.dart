
import 'package:flutter/material.dart';
import 'package:untitled/presention/Screens/authentication/login.dart';

import '../../../core/constant/Colors.dart';
import '../../../core/constant/Strings.dart';
import '../../../core/custom/button/buttonCustom.dart';
import 'createAccount.dart';


class TermsWidget extends StatelessWidget {
  ScrollController? controllerScroll;
  TermsWidget({Key? key,this.controllerScroll }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = AppText.tearms;
    return Stack(
      children:[
        Positioned(child:  Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            controller:controllerScroll ,
            child: Column(children: [
              Text(style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),AppText.tearms),
              const SizedBox(height: 25,),

              Container(alignment: Alignment.center,child:  Text(AppText.tearms1,
                textAlign: TextAlign.center,style: const TextStyle(fontSize: 15,color: AppColors.black,)
                ,),),
              const SizedBox(height: 25,),
              Container(alignment: Alignment.center,child:  Text(AppText.tearm2,),),
              const SizedBox(height: 25,),

              Container(alignment: Alignment.center,child:  Text( AppText.tearm3
                ,textAlign: TextAlign.center
                ,),),
              const SizedBox(height: 25,),

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
                    builder: (context) => login(),
                  ),
                );
              },
              text: AppText.send,
            ),
            const SizedBox(height: 3),
            TextButton(onPressed: (){ Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateAccount(),
              ),
            );}, child:  Text(AppText.back,style: TextStyle(color: Colors.pink),)),

          ],),


        )
      ],
    );

  }
}