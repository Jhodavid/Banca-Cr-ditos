import 'package:flutter/material.dart';

import 'package:banca_creditos/domain/entities/type_credits_enum.dart';
import 'package:banca_creditos/config/localization/app_localization.dart';



class PopTypeCredits extends StatefulWidget {

  final void Function(TypeCreditsEnum value) onChanged;

  const PopTypeCredits({
    super.key,
    required this.onChanged,
  });

  @override
  State<PopTypeCredits> createState() => _PopTypeCreditsState();
}

class _PopTypeCreditsState extends State<PopTypeCredits> {

  bool isVisibleOptions = false;
  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.home_what_type_credit,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Colors.black
            ),
          ),
          Container(
            height: 54,
            padding: const EdgeInsets.only(top: 10),
            child: MenuAnchor(
              builder: (context, controller, child) {
                return Material(
                  surfaceTintColor: Colors.white,
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      if(controller.isOpen) {
                        controller.close();
                      } else {
                        controller.open();
                      }
                    },
                    child: TextField(
                      enabled: false,
                      controller: textEditingController,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold
                      ),
                      decoration: InputDecoration(
                        hintText: l10n.home_what_select_credit_type,
                        hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: const Color(0xFFB1B5BB)
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: const EdgeInsets.only(
                          top: 5,
                          left: 10,
                          right: 10
                        ),
                        suffixIcon: AnimatedRotation(
                          turns: isVisibleOptions ? 0.25 : 0.75,
                          duration: const Duration(milliseconds: 200),
                          child: const Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 18,
                            color: Colors.grey,
                          )
                        ),
                      ),
                    ),
                  )
                );
              },
              menuChildren: TypeCreditsEnum.values.map(
                (typeCredit) {
                  return MenuItemButton(
                    onPressed: () {
                      widget.onChanged(typeCredit);
                      textEditingController.text = typeCredit.getName(l10n);
                    },
                    child: SizedBox(
                      width: width*0.835,
                      child: Text(
                        typeCredit.getName(l10n),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  );
                }
              ).toList(),
              onClose: () => setState(() => isVisibleOptions = false),
              onOpen: () => setState(() => isVisibleOptions = true),
            ),
          ),
          const SizedBox(height: 16)
        ],
      ),
    );
  }
}
