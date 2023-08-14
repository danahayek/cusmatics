import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constant/Colors.dart';
import '../../../core/constant/ImagesPath.dart';
import '../../../core/constant/Strings.dart';
import '../authentication/login.dart';
import 'boardingWidget/onBoardingWidget.dart';
class onBoardingScreen extends StatefulWidget {
  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();

}

class _onBoardingScreenState extends State<onBoardingScreen> {
  final _controller = PageController();
  int _currentPage = 0;


  final List<Map<String, String>> splashData = [

    {
      "title": AppText.boardingTitle1,
      "subtitle": AppText.boardingSubtitle1,
    "image": ImagesPath.boarding1
    },
    {
      "title": AppText.boardingTitle2,
      "subtitle":AppText.boardingSubtitle2,
      "image": ImagesPath.boarding2
    },
    {
      "title":AppText.boardingTitle3,
      "subtitle":  AppText.boardingSubtitle3,
      "image": ImagesPath.boarding3
    },
  ];

  AnimatedContainer _buildDots({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color:  Colors.white70,
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        color: AppColors.lightPink,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: splashData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return onBoardingwidget(
                      splashData[index]['title']!,
                      splashData[index]['subtitle']!,
                      splashData[index]['image']!,

                    );
                  },
                  onPageChanged: (value) {
                    if((splashData.length -1) == value){
                      Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context)=> login()),
                      );
                    }
                    setState(() {
                      _currentPage = value;
                    });
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                              (int index) => _buildDots(index: index),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: IconButton(
                          onPressed: (){
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            size: 35,
                            color: AppColors.white,
                          ),
                        )),
                    Spacer(),
                  ],
                ),
              ),

            ],

          ),

        ),

      ),) ;

  }
}