import 'package:flutter/material.dart';
import 'package:mentor/shared/utils/extensions.dart';

class SocialButton extends StatelessWidget {
  SocialButton(
      {super.key, required this.text, required this.onPressed, this.imgPath});

  String text;
  String? imgPath;
  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: InkWell(
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.tertiary),
                borderRadius: BorderRadius.circular(8)),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              if (imgPath != null) ...[
                Image.asset(
                  imgPath!,
                  width: 24,
                ),
              ],
              const SizedBox(width: 10),
              Text(text, style: context.titleSmall)
            ]),
          ),
        ));
  }
}
