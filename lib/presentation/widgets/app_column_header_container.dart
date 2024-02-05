import 'package:flutter/material.dart';



class AppColumnHeaderContainer extends StatelessWidget {

  final String title;
  final double portionSize;

  const AppColumnHeaderContainer({
    super.key,
    required this.title,
    required this.portionSize
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      alignment: Alignment.center,
      width: (width*0.9)*portionSize,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 13
        ),
      ),
    );
  }
}