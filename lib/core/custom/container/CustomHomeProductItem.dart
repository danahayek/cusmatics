
import 'package:flutter/material.dart';
import 'package:untitled/core/custom/text/boldText.dart';

import '../../constant/Strings.dart';
import '../../model/Product.dart';
import '../../model/ProductItems.dart';
import 'CustomProductItem.dart';
class CustomHomeProductItem extends StatelessWidget{

  List<ProductItems>? items;
  String? title;
  CustomHomeProductItem({this.items , this.title});

  var isLoaded = false;




  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            SizedBox(width:20 ,),
            SubTitleText(subTitle: AppText.more),
            SizedBox(width:190 ,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23
              ),
              child: CustomText(
                text: title?? '',
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            itemBuilder:(context, index) {
              ProductItems product = items![index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: Row(children: [
                   // CustomProductItem(product , 170,200,)
                  ]),
                ),
              );
            },
            itemCount: items?.length??0,
            scrollDirection: Axis.horizontal,
          ),
        )
      ],);
  }}
