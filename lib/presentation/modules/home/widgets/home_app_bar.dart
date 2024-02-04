import 'package:banca_creditos/config/localization/app_localization.dart';
import 'package:flutter/material.dart';



class HomeAppBar extends StatelessWidget {

  final bool isVisibleMessage;

  const HomeAppBar({
    super.key,
    this.isVisibleMessage = true
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width*0.05),
      child: Row(
        children: [
          if(isVisibleMessage) Text(
            'Hola Jesús G. 👋',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.normal),
          ),
          const Spacer(),
          SizedBox(
            width: 50,
            height: 50,
            child: TextButton(
                onPressed: () {

                },
                child: Image.asset('assets/notification.png')
            ),
          )
        ],
      ),
    );
  }
}
