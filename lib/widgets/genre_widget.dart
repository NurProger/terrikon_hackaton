import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackaton_terricon/constance/color.dart';
class GenreWidget extends StatelessWidget {
  final String name;
  const GenreWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        return Stack(
          children: [
            Container(
              width: 183,
              height: 120,
              child: SvgPicture.asset('assets/svg-images/GenreImage.svg',width:65,),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width:135,
                  height: 35,
                  decoration: BoxDecoration(
                      color: kGreenColor,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  child: Center(
                    child: Text(
                      name,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.07,
                      ),
                    ),
                  ),
              ),
            )
          ],
        );
      },
    );
  }
}
