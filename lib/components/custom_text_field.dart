import 'package:calenar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;

  const CustomTextField({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              color: PRIMARY_COLOR, fontWeight: FontWeight.w600),
        ),
        TextField(
          cursorColor: Colors.grey,
          decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey[300]),
        ),
      ],
    );
  }
}