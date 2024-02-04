import 'package:flutter/material.dart';



class AppFilledButton extends StatelessWidget {

  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final void Function() onPressed;

  const AppFilledButton({
    super.key,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      child: FilledButton(
        style: ButtonStyle(
          backgroundColor: backgroundColor != null ? MaterialStatePropertyAll<Color>(backgroundColor!) : null,
          shape: borderColor != null
            ? MaterialStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                side: BorderSide(color: borderColor!),
                borderRadius: BorderRadius.circular(10)
              )
            ) : null
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: textColor
          ),
        )
      ),
    );
  }
}
