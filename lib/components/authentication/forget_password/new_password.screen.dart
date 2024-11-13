import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:go_router/go_router.dart';
import 'package:mentor/navigation/router.dart';
import 'package:mentor/shared/utils/extensions.dart';
import 'package:mentor/shared/utils/validator.dart';
import 'package:mentor/shared/views/button.dart';
import 'package:mentor/shared/views/input_field.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final validator = Validator();

  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController rePasswordCtrl = TextEditingController();
  bool _passwordVisible = true;
  bool _rePasswordVisible = true;

  @override
  void dispose() {
    passwordCtrl.dispose();
    rePasswordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isKeyboardVisibility =
        MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
                child: KeyboardDismissOnTap(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () => context.pop(),
                              icon: Icon(Icons.arrow_back,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer)),
                        ],
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          if (!isKeyboardVisibility) ...[
                            Center(
                              child: Image.asset(
                                "assets/images/reset_password.png",
                                fit: BoxFit.contain,
                                width: MediaQuery.of(context).size.width * 0.7,
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                          Text('Create New Password',
                              style: context.titleLarge),
                          Text('Use strong password', style: context.bodySmall),
                          const SizedBox(
                            height: 20,
                          ),
                          formNewPassword(context),
                        ],
                      )),
                    ])))));
  }

  Widget formNewPassword(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InputField(
                controller: passwordCtrl,
                validator: (value) {
                  return validator.required(value, 'This field is required');
                },
                obscureText: _passwordVisible,
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 18,
                    )),
                labelText: 'Password'),
            const SizedBox(
              height: 20,
            ),
            InputField(
                controller: rePasswordCtrl,
                validator: (value) {
                  return [
                    validator.required(value, 'This field is required'),
                    validator.matchExact(value, passwordCtrl.text,
                        'Re-password isn\'t match with password')
                  ][0];
                },
                obscureText: _rePasswordVisible,
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _rePasswordVisible = !_rePasswordVisible;
                      });
                    },
                    icon: Icon(
                      _rePasswordVisible
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 18,
                    )),
                labelText: 'Re-Password'),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
                minWidth: MediaQuery.of(context).size.width,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    //TODO: Logic here
                    context.push(AppRoutes.successResetPassword);
                  }
                },
                label: "Next"),
          ],
        ));
  }
}
