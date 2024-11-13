import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ETypeInput { intType, decimalType, textType }

class InputField extends StatelessWidget {
  InputField(
      {super.key,
      this.initialValue,
      this.labelText,
      this.maxLines = 1,
      this.onChanged,
      this.keyboardType,
      this.inputFormatters,
      this.placeholder,
      this.controller,
      this.maxLength,
      this.validator,
      this.suffixIcon,
      this.prefixIcon,
      this.obscureText = false,
      this.readOnly = false,
      this.inputType = ETypeInput.textType});
  String? initialValue;
  String? labelText;
  String? placeholder;
  int? maxLines;
  int? maxLength;
  Widget? suffixIcon;
  Widget? prefixIcon;
  String? Function(String?)? validator;
  TextInputType? keyboardType;
  List<TextInputFormatter>? inputFormatters;
  ETypeInput? inputType;
  Function(String)? onChanged;
  TextEditingController? controller;
  bool obscureText;
  bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      controller: controller,
      onChanged: onChanged,
      maxLines: maxLines,
      maxLength: maxLength,
      validator: validator,
      obscureText: obscureText,
      keyboardType: inputType == ETypeInput.decimalType
          ? const TextInputType.numberWithOptions(decimal: true)
          : keyboardType,
      inputFormatters: inputType == ETypeInput.decimalType
          ? [
              FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
            ]
          : inputFormatters,
      decoration: InputDecoration(
          isDense: true,
          hintText: placeholder,
          labelText: labelText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
    );
  }
}
