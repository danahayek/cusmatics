
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/core/constant/ImagesPath.dart';
import 'package:untitled/core/custom/text/boldText.dart';

import '../../constant/Colors.dart';
import '../../model/category.dart';
class CustomProductItem extends StatelessWidget{


  final CategoryModel product;
  CustomProductItem(this.product);


  @override
  Widget build(BuildContext context) {
    return Container(
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
                        Positioned(
                          top: 50,
                          left: 50,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.yellow,
                              ),
                              child: Center(child: SvgPicture.asset(ImagesPath.vector)),
                            ),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Positioned(
                          top: 50,
                          left: 50,
                          child:Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.lightPink,
                              ),

                              child: const Center(child: Text ("%20" ,textAlign: TextAlign.center,style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.normal,)),
                              ),
                            ),
                          ),
                        ),
                      ],),
                    const SizedBox(width: 5,),
                    SvgPicture.asset(product.image),
                  ],),
                ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(text:product.title, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    product.oldPrice as String,
                    style: const TextStyle(
                      fontSize: 18,
                      decoration: TextDecoration.lineThrough,
                      color: AppColors.lightGray,
                    ),
                  ),
                  const SizedBox(width: 10),
                  SvgPicture.asset(ImagesPath.shekel, width: 15,height: 10,),
                  const SizedBox(width: 5),
                  Text(
                    product.price as String,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: AppColors.pink),
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
                  product.city,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white
                  ),),
              ),
            )
          ],)
    );
  }
}
