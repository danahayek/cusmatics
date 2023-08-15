import 'package:flutter/material.dart';
import 'package:untitled/core/custom/text/boldText.dart';

import '../../constant/Colors.dart';
import '../../constant/Strings.dart';
import '../../model/Favorite.dart';
class CustomFavoriteContainer extends StatelessWidget{

  final Favorite favorite;

  const CustomFavoriteContainer({super.key, required this.favorite});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 290,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3), // changes the shadow direction
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Positioned(
                  right: 15, // Adjust the position of the icon outside the circle
                  bottom: 10, // Adjust the position of the icon outside the circle
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.pink,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                  // Background color for the circle
                ),

              ),
              Positioned(
                top: 5,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColors.white,
                  backgroundImage: AssetImage(favorite.image),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          CustomText(text: favorite.name, fontWeight: FontWeight.bold, fontSize: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 75,
              height: 23,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColors.pink,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    AppText.city,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.white,
                    ),
                  ),
                  Icon(Icons.location_on_outlined , color: AppColors.white,size: 15,),
                  SizedBox(width: 5,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
