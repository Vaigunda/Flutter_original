import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:go_router/go_router.dart';
import 'package:mentor/components/authentication/widgets/social_button.dart';
import 'package:mentor/navigation/router.dart';
import 'package:mentor/shared/utils/extensions.dart';
import 'package:mentor/shared/utils/validator.dart';
import 'package:mentor/shared/views/button.dart';
import 'package:mentor/shared/views/divider_with_text.dart';
import 'package:mentor/shared/views/input_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final validator = Validator();
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  bool _passwordVisible = true;
  bool isChecked = false;
  @override
  void dispose() {
    super.dispose();
    usernameCtrl.dispose();
    passwordCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboardVisibility = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
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
                          child: SingleChildScrollView(
                              child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          if (!isKeyboardVisibility) ...[
                            Center(
                              child: Image.asset(
                                "assets/images/sign_up.png",
                                fit: BoxFit.contain,
                                width: MediaQuery.of(context).size.width * 0.5,
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                          Text('Create Account,', style: context.displayMedium),
                          Text('Sign up to get started!',
                              style: context.bodyMedium),
                          const SizedBox(
                            height: 20,
                          ),
                          formSignUp(context),
                          const SizedBox(
                            height: 16,
                          ),
                          if (!isKeyboardVisibility) ...[
                            socialSignUp(context),
                          ]
                        ],
                      ))),
                    ])))));
  }

  Widget formSignUp(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputField(
              controller: usernameCtrl,
              validator: (value) {
                return validator.required(value, 'This field is required');
              },
              labelText: "Username",
              prefixIcon: const Icon(Icons.account_circle_outlined),
            ),
            const SizedBox(
              height: 20,
            ),
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
              height: 10,
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Text("Remember me", style: context.titleSmall)
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            CustomButton(
                minWidth: MediaQuery.of(context).size.width,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    //TODO: Logic here
                  }
                },
                label: "Sign up"),
          ],
        ));
  }

  Widget socialSignUp(BuildContext context) {
    return Column(
      children: [
        DividerWithText(
            label: "Or continue with",
            styleLabel: context.bodySmall,
            colorDivider: Theme.of(context).colorScheme.tertiary),
        const SizedBox(
          height: 16,
        ),
        SocialButton(
          text: "Continue with Google",
          imgPath: "assets/images/gg.png",
          onPressed: () => {},
        ),
        const SizedBox(
          width: 16,
        ),
        SocialButton(
          text: "Continue with Apple",
          imgPath: "assets/images/ios.png",
          onPressed: () => {},
        ),
        const SizedBox(
          width: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Already a member!', style: context.bodyMedium),
            TextButton(
                onPressed: () => context.push(AppRoutes.signin),
                child: Text('Sign in',
                    style: TextStyle(color: context.colors.primary))),
          ],
        )
      ],
    );
  }
}
