import 'package:flutter/material.dart';
import 'package:hackaton_terricon/constance/color.dart';
import 'package:hackaton_terricon/constance/size.dart';
import 'package:hackaton_terricon/widgets/button_border.dart';
class AboutBookView extends StatelessWidget {
  final String cover_url;
  final String name;
  final String description;
  final int rating;
  const AboutBookView({
    super.key,
    required this.name,
    required this.cover_url,
    required this.description,
    required this.rating
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(24.0,),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.chevron_left,size: 30,color: Colors.white,)),
              Container(
                width: double.infinity,
                height: 550,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(cover_url),fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(25)
                ),
              ),
              SizedBox(height: heightApp(context) * .02,),
              ButtonBorderWidget(text: 'Задолжать', onTap: (){}),
              SizedBox(height: heightApp(context) * .02,),
              betweenLine(),
              SizedBox(height: heightApp(context) * .02,),
              Text(name,style: TextStyle(color: Colors.white,fontSize: 24,
              fontWeight: FontWeight.w500),),
              SizedBox(height: heightApp(context) * .01,),
              Row(
                children:generateStars(rating)
              ),
              SizedBox(height: heightApp(context) * .02,),
              betweenLine(),
              SizedBox(height: heightApp(context) * .02,),
              Text(description,style: TextStyle(color: Colors.white,fontSize: 17,),),
            ],
          ),
        ),
      ),
    );
  }

  Container betweenLine() {
    return Container(
            width: double.infinity,
            height: 1,
            decoration: BoxDecoration(
              color: kTextColor
            ),
          );
  }
  generateStars(int rating) {
    List<Widget> stars = [];
    for (int i = 0; i < rating; i++) {
      stars.add(const Icon(
        Icons.star_outlined,
        color: Colors.yellow,
        size: 20,
      ));
    }
    for (int i = rating; i < 5; i++) {
      stars.add(const Icon(
        Icons.star_border,
        color: Colors.yellow,
        size: 20,
      ));
    }
    return stars;
  }
}
