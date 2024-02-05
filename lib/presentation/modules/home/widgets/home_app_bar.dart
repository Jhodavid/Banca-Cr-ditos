import 'package:banca_creditos/config/localization/app_localization.dart';
import 'package:banca_creditos/presentation/providers/current_user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class HomeAppBar extends ConsumerWidget {

  final bool isVisibleMessage;

  const HomeAppBar({
    super.key,
    this.isVisibleMessage = true
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final width = MediaQuery.of(context).size.width;

    final currentUserDataState = ref.watch(currentUserDataProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width*0.05),
      child: Row(
        children: [
          if(isVisibleMessage) Row(
            children: [
              Text(
                context.getHomeHiUser(currentUserDataState.currentUser?.fullName ?? ''),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.normal),
              ),
              SizedBox(
                width: 20,
                height: 20,
                child: Image.asset('assets/waving_hand.png')
              )
            ],
          ),
          const Spacer(),
          SizedBox(
            width: 50,
            height: 50,
            child: TextButton(
              onPressed: () {},
              child: Image.asset('assets/notification.png')
            ),
          )
        ],
      ),
    );
  }
}
