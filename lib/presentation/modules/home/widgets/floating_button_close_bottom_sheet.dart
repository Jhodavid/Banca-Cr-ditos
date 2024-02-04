import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';



class FloatingButtonCloseBottomSheet extends StatelessWidget {

  const FloatingButtonCloseBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      elevation: 2,
      shape: const CircleBorder(),
      backgroundColor: Colors.white,
      child: Icon(Icons.close, color: Theme.of(context).colorScheme.primary),
      onPressed: () => context.pop(),
    );
  }
}
