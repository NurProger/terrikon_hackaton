import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackaton_terricon/constance/size.dart';
class LibraryNavigation extends StatelessWidget {
  const LibraryNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: [
              SizedBox(height: heightApp(context) * 0.02,),
              Text('1 этаж',style: TextStyle(color: Colors.white),),
              SvgPicture.asset('assets/svg-images/1_floor.svg',),
              SizedBox(height: heightApp(context) * 0.02,),
              Text('2 этаж',style: TextStyle(color: Colors.white)),
              SvgPicture.asset('assets/svg-images/2_floor.svg',),
              SizedBox(height: heightApp(context) * 0.02,),
              Text('3этаж',style: TextStyle(color: Colors.white)),
              SvgPicture.asset('assets/svg-images/3_floor.svg',),
            ],
          ),
        ),
      ),
    );
  }
}
