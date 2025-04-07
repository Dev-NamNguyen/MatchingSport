import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:matchingsport/features/authentication/widgets/main_background.dart';
import 'package:matchingsport/providers/theme.provider.dart';
import 'package:matchingsport/res/app.context.extension.dart';
import 'package:matchingsport/res/enums/button_type.dart';
import 'package:matchingsport/res/resources.dart';
import 'package:matchingsport/widgets/atoms/base_button.dart';
import 'package:matchingsport/widgets/atoms/base_input.dart';
import 'package:matchingsport/widgets/molecules/text_checkbox.dart';
import 'package:matchingsport/widgets/molecules/text_divider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final Resources resources = context.resources;

    return Scaffold(
      body: MainBackground(
        child: Column(
          children: [
            Container(
              height: screenSize.height * 0.3,
            ),
            Expanded(
              child: Container(
                width: screenSize.width,
                decoration: BoxDecoration(
                  color: resources.colors.primaryBackground,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SafeArea(
                    top: false,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 27, right: 27, top: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const LoginForm(),
                          TextDivider(
                            text: "or",
                            color: resources.colors.normalOutlineInput,
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final Resources resources = context.resources;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(resources.constant.loginFormString.title,
            style: TextStyle(
                fontSize: resources.sizes.textLarge,
                color: resources.colors.primaryText,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 5.0),
        Text(
          resources.constant.loginFormString.welcomeBack,
          style: TextStyle(
              fontSize: resources.sizes.textSmall,
              color: resources.colors.primaryText),
        ),
        const SizedBox(height: 20.0),
        const BaseInput(
          hiddenText: "Email",
        ),
        const SizedBox(height: 20.0),
        const BaseInput(
          isObscureText: true,
          hiddenText: "Password",
        ),
        const SizedBox(height: 15.0),
        TextCheckBox(
            text: "Remember information",
            onChanged: (bool? value) {
              // Handle checkbox change
            }),
        BaseButton(
          onPressed: () {},
          content: "Join now",
          backgroundColor: resources.colors.primary,
          buttonType: ButtonType.large,
        ),
        const SizedBox(height: 20.0),
        Text(
          "Forgot password?",
          style: TextStyle(
              color: resources.colors.primaryLink,
              fontSize: resources.sizes.textNormal,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 15),
        RichText(
            text: TextSpan(
          children: [
            TextSpan(
              text: "First time here? ",
              style: TextStyle(
                  color: resources.colors.primaryText,
                  fontSize: resources.sizes.textNormal,
                  fontWeight: FontWeight.w300),
            ),
            TextSpan(
              text: "Sign up for free",
              style: TextStyle(
                  color: resources.colors.primary,
                  fontSize: resources.sizes.textNormal,
                  fontWeight: FontWeight.w500),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Handle sign up tap
                },
            ),
          ],
        )),
      ],
    );
  }
}
