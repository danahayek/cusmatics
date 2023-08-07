import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/core/constant/Colors.dart';
import 'package:untitled/core/constant/ImagesPath.dart';
import 'package:untitled/core/constant/Strings.dart';
import 'package:untitled/core/custom/text/boldText.dart';

class HomeCustom extends StatelessWidget {

  final String image;
  final String title;
  final double price;
  final double oldPrice;
  final String city;

  const HomeCustom(
      {super.key,
        required this.image,
        required this.title,
        required this.price,
        required this.oldPrice,
        required this.city});

  @override
  Widget build(BuildContext context) {
    return

      Row(
        children: [
          Text("bn"),
          SizedBox(width: 20,),
          Text("fghjdkl"),
          Container(
            width: 170,
            height: 340,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 3), // changes the position of the shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Row(children: [
                        Column(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.yellow,
                              ),
                              child: Center(child: SvgPicture.asset(ImagesPath.vector)),
                            ),
                            SizedBox(height: 8,),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.pink,
                              ),
                              child: Center(child: Text ("%20" ,textAlign: TextAlign.center,style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.normal,)),

                              ),
                            ),
                          ],),
                        SizedBox(width: 5,),
                        Image.asset(image),
                      ],),
                    ]),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(text: title, fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        oldPrice as String,
                        style: TextStyle(
                          fontSize: 18,
                          decoration: TextDecoration.lineThrough,
                          color: AppColors.lightGray,
                        ),
                      ),
                      SizedBox(width: 10),
                      SvgPicture.asset(ImagesPath.shekel, width: 15,height: 10,),
                      SizedBox(width: 5),
                      Text(
                        price as String,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: AppColors.pink),
                      ),
                    ],),
                ),
                Container(
                  width: 100,
                  height: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: AppColors.pink,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      city,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white
                      ),),
                  ),
                )
              ],)
    ),
        ],
      );
  }
}
