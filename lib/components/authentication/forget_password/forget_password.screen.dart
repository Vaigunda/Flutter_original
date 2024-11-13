import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:go_router/go_router.dart';
import 'package:mentor/navigation/router.dart';
import 'package:mentor/shared/utils/extensions.dart';
import 'package:mentor/shared/utils/validator.dart';
import 'package:mentor/shared/views/button.dart';
import 'package:mentor/shared/views/input_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final validator = Validator();
  TextEditingController emailCtrl = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailCtrl.dispose();
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
                                "assets/images/forget_password.png",
                                fit: BoxFit.contain,
                                width: MediaQuery.of(context).size.width * 0.7,
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                          Text('Forgot your password?',
                              style: context.titleLarge),
                          Text(
                              'Enter your email address below, we’ll send you a verify code.!',
                              style: context.bodySmall),
                          const SizedBox(
                            height: 20,
                          ),
                          formRecovery(context),
                        ],
                      )),
                    ])))));
  }

  Widget formRecovery(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InputField(
              controller: emailCtrl,
              validator: (value) {
                return validator.required(value, 'This field is required');
              },
              labelText: "Email",
              prefixIcon: const Icon(Icons.email_outlined),
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
                minWidth: MediaQuery.of(context).size.width,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    //TODO: Logic here
                    context.push('${AppRoutes.verifyCode}/${emailCtrl.text}');
                  }
                },
                label: "Next"),
          ],
        ));
  }
}
