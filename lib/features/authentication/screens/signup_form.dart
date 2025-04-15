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
  final TextEditingController _fristNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _agree = false;

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
            resources.constant.signupFormString.title,
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
            resources.constant.signupFormString.hi,
            style: TextStyle(
              fontSize: resources.sizes.textSmall,
              color: resources.colors.primaryText,
            ),
          ),
        ),
        const SizedBox(height: 20),
        BaseInput(
          controller: _fristNameController,
          hiddenText: resources.constant.signupFormString.hiddenInputFirstName,
        ),
        const SizedBox(height: 15),
        BaseInput(
          controller: _lastNameController,
          hiddenText: resources.constant.signupFormString.hiddenInputLastName,
        ),
        const SizedBox(height: 15),
        BaseInput(
          controller: _emailController,
          hiddenText: resources.constant.signupFormString.hiddenInputEmail,
        ),
        const SizedBox(height: 15),
        BaseInput(
          controller: _phoneController,
          hiddenText: resources.constant.signupFormString.hiddenInputPhone,
        ),
        const SizedBox(height: 15),
        BaseInput(
          controller: _passwordController,
          isObscureText: true,
          hiddenText: resources.constant.signupFormString.hiddenInputPassword,
        ),
        const SizedBox(height: 15),
        TextCheckBox(
          text: resources.constant.signupFormString.agree,
          value: _agree,
          onChanged: (bool? value) {
            setState(() {
              _agree = value ?? false;
            });
          },
        ),
        const SizedBox(height: 20),
        BaseButton(
          onPressed: () {
            final email = _emailController.text.trim();
            final password = _passwordController.text.trim();
            final fname = _fristNameController.text.trim();
            final lname = _lastNameController.text.trim();
            final phone = _phoneController.text.trim();
            final agree = _agree;

            if (email.isEmpty ||
                password.isEmpty ||
                fname.isEmpty ||
                lname.isEmpty ||
                phone.isEmpty) {
              print("please fill all");
            } else {
              print(
                  "email: $email, password: $password, remember: $agree, first name: $fname, last name: $lname, phone: $phone");
            }
          },
          isDisabled: !_agree,
          content: resources.constant.signupFormString.buttonContent,
          backgroundColor: resources.colors.primary,
          buttonType: ButtonType.large,
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
