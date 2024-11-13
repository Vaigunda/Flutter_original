import 'package:flutter/material.dart';
import 'package:mentor/shared/shared.dart';

enum EButtonType { primary, secondary, outline }

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.minWidth,
      this.type = EButtonType.primary,
      this.padding});

  String label;
  double? minWidth;
  bool disabled = false;
  EButtonType? type;
  WidgetStateProperty<EdgeInsetsGeometry?>? padding;
  void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    WidgetStatePropertyAll<Size>? minimumSize;
    if (minWidth != null) {
      minimumSize = WidgetStatePropertyAll<Size>(Size(minWidth!, 48));
    }

    if (type == EButtonType.primary) {
      return ElevatedButton(
        style: ButtonStyle(
            elevation: WidgetStateProperty.all(5),
            minimumSize: minimumSize,
            shadowColor: WidgetStatePropertyAll<Color>(
                Theme.of(context).colorScheme.surfaceTint),
            backgroundColor: WidgetStatePropertyAll<Color>(
                Theme.of(context).colorScheme.primary)),
        onPressed: onPressed,
        child: Text(label,
            style: context.labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.onPrimary)),
      );
    }
    if (type == EButtonType.secondary) {
      return ElevatedButton(
        style: ButtonStyle(
            elevation: WidgetStateProperty.all(5),
            minimumSize: minimumSize,
            shadowColor: WidgetStatePropertyAll<Color>(
                Theme.of(context).colorScheme.surfaceContainerHighest),
            backgroundColor: WidgetStatePropertyAll<Color>(
                Theme.of(context).colorScheme.primaryContainer)),
        onPressed: onPressed,
        child: Text(label,
            style: context.labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.primary)),
      );
    }
    return OutlinedButton(
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(0),
        side: WidgetStateProperty.all(
            BorderSide(color: Theme.of(context).colorScheme.primary)),
        minimumSize: minimumSize,
        shadowColor: WidgetStatePropertyAll<Color>(
            Theme.of(context).colorScheme.surfaceTint),
      ),
      onPressed: onPressed,
      child: Text(label,
          style: context.labelMedium!
              .copyWith(color: Theme.of(context).colorScheme.primary)),
    );
  }
}
