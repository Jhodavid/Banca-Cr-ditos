import 'package:flutter/material.dart';



class AppTextField extends StatelessWidget {

  final String label;
  final String hintText;
  final IconData? prefixIconData;
  final void Function(String value) onChanged;

  const AppTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.prefixIconData,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Colors.grey
            ),
          ),
          Container(
            height: 55,
            padding: const EdgeInsets.only(top: 10),
            child: TextField(
              onChanged: onChanged,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: const Color(0xFFB1B5BB)
                ),
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
          const SizedBox(height: 16)
        ],
      ),
    );
  }
}
