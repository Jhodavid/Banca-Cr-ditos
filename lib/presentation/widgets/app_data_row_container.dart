import 'package:flutter/material.dart';



class AppDataRowContainer extends StatelessWidget {

  final String text;
  final Color textColor;
  final BorderSide topBorderSide;
  final BorderSide bottomBorderSide;
  final BorderSide leftBorderSide;
  final BorderSide rightBorderSide;

  const AppDataRowContainer({
    super.key,
    required this.text,
    this.textColor = Colors.black,
    this.topBorderSide = const BorderSide(width: 1, color: Color(0xffEDF2F6)),
    this.bottomBorderSide = const BorderSide(width: 1, color: Color(0xffEDF2F6)),
    this.leftBorderSide = const BorderSide(width: 1, color: Color(0xffEDF2F6)),
    this.rightBorderSide = BorderSide.none
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        border: Border(
          top: topBorderSide,
          bottom: bottomBorderSide,
          left: leftBorderSide,
          right: rightBorderSide
        ),
      ),
      alignment: Alignment.center,
      child: Text(text, style: TextStyle(color: textColor, fontSize: 12)),
    );
  }
}
