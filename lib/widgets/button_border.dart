import 'package:flutter/material.dart';
import 'package:hackaton_terricon/constance/color.dart';
class ButtonBorderWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const ButtonBorderWidget({
    super.key,
    required this.text, required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 42,
        decoration: BoxDecoration(
            color: kButtonColor,
            borderRadius: BorderRadius.circular(100)
        ),
        child: Center(child: Text(text,style: TextStyle(fontSize: 17,color: kTextColor,fontWeight: FontWeight.w500),)),
      ),
    );
  }
}
