import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  GradientButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.colors = const [Color(0XFFF1087E), Color(0XFFfc945f)],
      this.trailingIcon});

  Text label;
  List<Color> colors;
  Widget? trailingIcon;
  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: colors)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent),
        onPressed: onPressed,
        child: trailingIcon == null
            ? label
            : Row(
                children: [
                  label,
                  const SizedBox(
                    width: 10,
                  ),
                  trailingIcon!
                ],
              ),
      ),
    );
  }
}
