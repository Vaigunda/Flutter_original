import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  DividerWithText(
      {super.key, required this.label, this.colorDivider, this.styleLabel});
  String label;
  TextStyle? styleLabel;
  Color? colorDivider;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Divider(
          color: colorDivider,
        )),
        const SizedBox(width: 10),
        Text(label, style: styleLabel),
        const SizedBox(width: 10),
        Expanded(child: Divider(color: colorDivider)),
      ],
    );
  }
}
