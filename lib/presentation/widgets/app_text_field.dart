import 'package:flutter/material.dart';



class AppTextField extends StatelessWidget {

  final String? label;
  final Color labelTextColor;
  final String hintText;
  final String? helperText;
  final IconData? prefixIconData;
  final bool isEnabled;
  final void Function(String value) onChanged;

  const AppTextField({
    super.key,
    this.label,
    this.labelTextColor = Colors.grey,
    required this.hintText,
    this.helperText,
    this.prefixIconData,
    this.isEnabled = true,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    double inputHeight = 74;
    inputHeight += helperText != null ? 16 : 0;
    inputHeight += label != null ? 20 : 1;

    return SizedBox(
      height: inputHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(label != null) Text(
            label!,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: labelTextColor
            ),
          ),
          Container(
            height: 55,
            padding: EdgeInsets.only(top: label != null ? 10 : 0),
            child: TextField(
              enabled: isEnabled,
              onChanged: onChanged,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: const Color(0xFFB1B5BB)
                ),
                fillColor: isEnabled ? Colors.white : const Color(0xffC8D0D9),
                filled: true,
                prefixIcon: prefixIconData != null
                  ? Icon(
                    prefixIconData!,
                    color: Colors.grey,
                    size: 22,
                  )
                  : null,
                contentPadding: EdgeInsets.only(
                  top: 5,
                  left: prefixIconData != null ? 0 : 10,
                  right: 10
                )
              ),
            ),
          ),
          const SizedBox(height: 4),
          if(helperText != null) Text(
            helperText!,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.grey
            ),
          ),
          const SizedBox(height: 16)
        ],
      ),
    );
  }
}
