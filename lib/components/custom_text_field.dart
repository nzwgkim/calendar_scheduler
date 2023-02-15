import 'package:calenar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isNumber;

  const CustomTextField(
      {required this.label, required this.isNumber, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
                color: PRIMARY_COLOR, fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: TextField(
              maxLines: isNumber ? 1 : null,
              expands: !isNumber,
              inputFormatters:
                  isNumber ? [FilteringTextInputFormatter.digitsOnly] : [],
              keyboardType:
                  isNumber ? TextInputType.number : TextInputType.multiline,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey[300]),
            ),
          ),
        ],
      ),
    );
  }
}
