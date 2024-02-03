import 'package:flutter/material.dart';



class OnBoardingImageAndMessage extends StatelessWidget {

  final String imagePath;
  final String message;

  const OnBoardingImageAndMessage({
    super.key,
    required this.imagePath,
    required this.message
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Stack(
          children: [
            Image.asset(
              fit: BoxFit.fitWidth,
              imagePath,
              width: width
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black87,
                    Colors.black
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.0,
                    0.85,
                    0.95
                  ]
                ),
              ),
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.only(
            bottom: 180,
            left: 15,
            right: 15
          ),
          alignment: Alignment.bottomLeft,
          child: Text(
            message,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        )
      ],
    );
  }
}
