import 'package:flutter/material.dart';
import 'package:untitled/core/model/Favorite.dart';
import 'package:untitled/presention/Screens/Home/favorite.dart';

import '../../../presention/Screens/Home/CartScreen.dart';
import '../../../presention/Screens/Home/notification.dart';
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
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationWidget(),
                  ),
                );
              },
              child: CustomContainer(
                  Icon(Icons.notifications_active_outlined, color: AppColors.black, size: 25),AppColors.lightGray,50,50),
            ),
            SizedBox(width: 10,),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoriteScreen()
                  ),
                );
              },
              child: CustomContainer(
                  Icon(Icons.favorite_border, color: AppColors.black, size: 25),AppColors.lightGray,50,50),
            ),
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
    );
  }

}


class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  String title;

  CustomAppBar2(this.title);

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
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => cartScreen(),
                    ),
                  );
                },
                child: CustomContainer(
                    Icon(Icons.shopping_cart_outlined, color: AppColors.pink, size: 25),AppColors.white,45,45),
              ),
              SizedBox(width: 10,),
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
    );
  }

}