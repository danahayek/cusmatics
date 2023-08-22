
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:untitled/core/constant/ImagesPath.dart';
import 'package:untitled/core/custom/text/boldText.dart';

import '../../constant/Colors.dart';
import '../../featuers/CategoryProducts/ProductProvider.dart';
import '../../model/Product.dart';
import '../../model/ProductItems.dart';
import '../../model/category.dart';
import '../../model/category.dart';
class CustomProductItem extends StatelessWidget{
  final Product product;
  double height;
  double width;
  CustomProductItem(this.product,this.width,this.height);
  List<Product> items =[];

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final productList = productProvider.items;


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
                        Positioned(
                          top: 50,
                          left: 50,
                          child:Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                            child: Container(
                              width: 35,
                              height: 35,
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

                    Image.network(product.image , width: 75, height:75,),
                  ],),
                ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(text: product.title, fontSize: 13),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    product.price.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      decoration: TextDecoration.lineThrough,
                      color: AppColors.lightGray,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    product.category.toString().split('.').last,
                    style: const TextStyle(fontSize: 10, color: AppColors.pink),
                  ),
                ],),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:15),
              child: Container(
                width: 75,
                height: 25,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: AppColors.pink,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      product.rating.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.white,
                      ),
                    ),
                    Icon(Icons.location_on_outlined , color: AppColors.white,size: 13,),
                    SizedBox(width: 5,),

                  ],
                ),
              ),
            )
          ],)
    );
  }
}

