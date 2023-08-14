import 'package:flutter/material.dart';
import 'package:untitled/core/constant/Colors.dart';
import 'package:untitled/core/constant/ImagesPath.dart';
import 'package:untitled/core/constant/Strings.dart';
import 'package:untitled/core/custom/appbar/CustomAppBar.dart';
class DetailScreen4 extends StatefulWidget {
  const DetailScreen4({Key? key}) : super(key: key);

  @override
  State<DetailScreen4> createState() => _DetailScreen4State();
}

class _DetailScreen4State extends State<DetailScreen4> {
  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          appBar:CustomAppBar2(AppText.homefurniture) ,
          body: Container(height: 230,
            width: double.infinity,
            color: AppColors.white,
            child: Image.asset(ImagesPath.table3),),

        );
  }
}
