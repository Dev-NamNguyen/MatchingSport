import 'package:flutter/material.dart';
import 'package:matchingsport/res/app.context.extension.dart';
import 'package:matchingsport/res/enums/button_type.dart';
import 'package:matchingsport/res/resources.dart';
import 'package:matchingsport/widgets/atoms/base_button.dart';
import 'package:matchingsport/widgets/atoms/base_input.dart';
import 'package:matchingsport/widgets/molecules/text_checkbox.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Resources resources = context.resources;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            resources.constant.loginFormString.title,
            style: TextStyle(
              fontSize: resources.sizes.textLarge,
              color: resources.colors.primaryText,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Center(
          child: Text(
            resources.constant.loginFormString.welcomeBack,
            style: TextStyle(
              fontSize: resources.sizes.textSmall,
              color: resources.colors.primaryText,
            ),
          ),
        ),
        const SizedBox(height: 20),
        BaseInput(
          controller: _emailController,
          hiddenText: "Email",
        ),
        const SizedBox(height: 15),
        BaseInput(
          controller: _passwordController,
          isObscureText: true,
          hiddenText: "Password",
        ),
        const SizedBox(height: 10),
        TextCheckBox(
          text: "Remember information",
          value: _rememberMe,
          onChanged: (bool? value) {
            setState(() {
              _rememberMe = value ?? false;
            });
          },
        ),
        const SizedBox(height: 20),
        BaseButton(
          onPressed: () {
            final email = _emailController.text.trim();
            final password = _passwordController.text.trim();
            final remember = _rememberMe;

            if (email.isEmpty || password.isEmpty) {
              print("please fill all");
            } else {
              print("email: $email, password: $password, remember: $remember");
            }
          },
          content: "Join now",
          backgroundColor: resources.colors.primary,
          buttonType: ButtonType.large,
        ),
        const SizedBox(height: 15),
        Center(
          child: Text(
            "Forgot password?",
            style: TextStyle(
              color: resources.colors.primaryLink,
              fontSize: resources.sizes.textNormal,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
