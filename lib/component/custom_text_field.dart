import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_calender/const/color.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isTime;
  const CustomTextField({
    super.key,
    required this.label,
    required this.isTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: primary_color,
          ),
        ),
        if (isTime) renderTextfield(),
        if (!isTime) Expanded(child: renderTextfield()),
      ],
    );
  }

  renderTextfield() {
    return TextField(
      maxLines: isTime ? 1 : null,
      expands: !isTime,
      inputFormatters: isTime
          ? [
              FilteringTextInputFormatter.digitsOnly,
            ]
          : [],
      keyboardType: isTime ? TextInputType.number : TextInputType.multiline,
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey[300],
      ),
    );
  }
}
