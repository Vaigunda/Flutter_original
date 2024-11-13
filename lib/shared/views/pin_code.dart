import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCode extends StatefulWidget {
  const PinCode(
      {super.key, required this.controller, required this.errorController});

  final TextEditingController controller;
  final StreamController<ErrorAnimationType> errorController;

  @override
  State<PinCode> createState() => _PinCodeState();
}

class _PinCodeState extends State<PinCode> {
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      pastedTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      length: 4,
      // obscureText: true,
      // obscuringCharacter: '*',
      // obscuringWidget: const FlutterLogo(
      //   size: 24,
      // ),
      // blinkWhenObscuring: true,
      animationType: AnimationType.fade,
      // validator: (v) {
      //   if (v!.length < 3) {
      //     return "I'm from validator";
      //   } else {
      //     return null;
      //   }
      // },
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          fieldWidth: MediaQuery.of(context).size.width / 5,
          borderRadius: BorderRadius.circular(5),
          selectedColor: Theme.of(context).colorScheme.primary,
          selectedFillColor: Theme.of(context).colorScheme.onSecondary,
          activeColor: Theme.of(context).colorScheme.primary,
          activeFillColor: Theme.of(context).colorScheme.primaryContainer,
          inactiveFillColor: Theme.of(context).colorScheme.onSecondary,
          inactiveColor: Theme.of(context).colorScheme.onSurfaceVariant,
          borderWidth: 1),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      errorAnimationController: widget.errorController,
      controller: widget.controller,
      keyboardType: TextInputType.number,
      cursorColor: Theme.of(context).colorScheme.primary,
      onCompleted: (v) {
        debugPrint("Completed");
      },
      // onTap: () {
      //   print("Pressed");
      // },
      onChanged: debugPrint,
      beforeTextPaste: (text) {
        debugPrint("Allowing to paste $text");
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
    );
  }
}
