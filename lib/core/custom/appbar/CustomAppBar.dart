import 'package:flutter/material.dart';

import '../../constant/Colors.dart';
import '../container/customC.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;

  CustomAppBar(this.title);

  @override
  Size get preferredSize => Size.fromHeight(120);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: AppColors.pink,
      automaticallyImplyLeading: false,
      title:
      Padding(
      padding: EdgeInsets.only(left: 15.0,top: 40.0),
      child:
          Row(
            children: [
            CustomContainer(
                Icon(Icons.notifications_active_outlined, color: AppColors.black, size: 25),AppColors.lightGray),
            SizedBox(width: 10,),
            CustomContainer(
                Icon(Icons.favorite_border, color: AppColors.black, size: 25),AppColors.lightGray),
          ],)

    ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20.0, top: 42.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              title,
              style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],

     /* leading:Padding(
        padding: EdgeInsets.only(right: 10.0, bottom: 8.0),
        child: Row( // Wrap the CustomContainer and title in a Row
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomContainer(Icon(Icons.notifications_none, color: AppColors.black, size: 25)),
            SizedBox(width: 15,),
            CustomContainer(Icon(Icons.favorite_border, color: AppColors.black, size: 25)),
            SizedBox(width: 100), // Add some spacing between the elements
            Text(
              title,
              style: TextStyle(fontSize: 26),
            ),
          ],
        ),
      ),*/
    );
  }

}