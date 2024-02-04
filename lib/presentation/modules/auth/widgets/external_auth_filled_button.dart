import 'package:flutter/material.dart';



class ExternalAuthFilledButton extends StatelessWidget {

  final String text;
  final String iconPath;
  final void Function() onPressed;

  const ExternalAuthFilledButton({
    super.key,
    required this.text,
    required this.iconPath,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width*0.85,
      height: 40,
      child: FilledButton.icon(
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
          side: const MaterialStatePropertyAll<BorderSide>(BorderSide(color: Color(0xffC8D0D9))),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)))
        ),
        icon: Image.asset(
          iconPath,
          height: 22,
        ),
        onPressed: () {

        },
        label: Text(
          text,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Colors.black
          )
        )
      ),
    );
  }
}
