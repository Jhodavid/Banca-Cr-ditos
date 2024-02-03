import 'package:flutter/material.dart';



class AppFilledButton extends StatelessWidget {

  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final void Function() onPressed;

  const AppFilledButton({
    super.key,
    required this.text,
    this.backgroundColor,
    this.textColor,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      child: FilledButton(
        style: ButtonStyle(
          backgroundColor: backgroundColor != null ? MaterialStatePropertyAll<Color>(backgroundColor!) : null
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: textColor
          ),
        )
      ),
    );
  }
}
