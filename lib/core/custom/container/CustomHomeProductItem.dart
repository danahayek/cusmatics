
import 'package:flutter/material.dart';
import 'package:untitled/core/custom/text/boldText.dart';
import 'package:untitled/core/model/category.dart';

import '../../constant/Strings.dart';
import 'CustomProductItem.dart';
class CustomHomeProductItem extends StatelessWidget{

  List<CategoryModel>? items;
  String? title;
  CustomHomeProductItem({this.items , this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            SizedBox(width:20 ,),
            SubTitleText(subTitle: AppText.more),
            SizedBox(width:210 ,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23
              ),
              child: CustomText(
                text: title?? '',
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            itemBuilder:(context, index) {
              CategoryModel product = items![index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: Row(children: [
                    CustomProductItem(product)
                  ]),
                ),
              );
            },
            itemCount: items?.length??0,
            scrollDirection: Axis.horizontal,
          ),
        )
      ],);
  }

}
