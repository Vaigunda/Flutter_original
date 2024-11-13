import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mentor/navigation/router.dart';
import 'package:mentor/shared/utils/extensions.dart';
import 'package:mentor/shared/views/button.dart';

class SuccessResetScreen extends StatefulWidget {
  const SuccessResetScreen({super.key});

  @override
  State<SuccessResetScreen> createState() => _SuccessResetScreenState();
}

class _SuccessResetScreenState extends State<SuccessResetScreen> {
  @override
  Widget build(BuildContext context) {
    final bool isKeyboardVisibility =
        MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
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
                          Text('Success!',
                              style: context.titleLarge?.copyWith(
                                  color: const Color.fromRGBO(34, 197, 94, 1))),
                          Text(
                              'Your password has been sent to your email address.',
                              style: context.bodySmall),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                              minWidth: MediaQuery.of(context).size.width,
                              onPressed: () {
                                context.push(AppRoutes.signin);
                              },
                              label: "Sign in"),
                        ],
                      )),
                    ]))));
  }
}
