import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:matchingsport/features/authentication/widgets/linear_login_register.dart';
import 'package:matchingsport/features/authentication/widgets/main_background.dart';
import 'package:matchingsport/models/content_login_register_model.dart';
import 'package:matchingsport/res/app.context.extension.dart';
import 'package:matchingsport/res/enums/button_type.dart';
import 'package:matchingsport/res/resources.dart';
import 'package:matchingsport/widgets/atoms/base_button.dart';
import 'package:matchingsport/widgets/atoms/base_input.dart';
import 'package:matchingsport/features/authentication/widgets/social_login_button.dart';
import 'package:matchingsport/widgets/molecules/text_checkbox.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final Resources resources = context.resources;

// pha ke
    final List<ContentLoginRegisterModel> newsItems = [
      ContentLoginRegisterModel(
          actor: "Michael Jordan ",
          content:
              "I've missed more than 9,000 shots in my career. I've lost almost 300 games. Twenty-six times I've been trusted to take the game-winning shot and missed. I've failed over and over and over again in my life. And that is why I succeed.",
          sport: "Basketball player",
          image: "https://cdn.nba.com/manage/2021/08/michael-jordan-looks.jpg"),
      ContentLoginRegisterModel(
          actor: "Michael Jordan ",
          content:
              "I've missed more than 9,000 shots in my career. I've lost almost 300 games. Twenty-six times I've been trusted to take the game-winning shot and missed. I've failed over and over and over again in my life. And that is why I succeed.",
          sport: "Basketball player",
          image: "https://cdn.nba.com/manage/2021/08/michael-jordan-looks.jpg"),
      ContentLoginRegisterModel(
          actor: "Michael Jordan ",
          content:
              "I've missed more than 9,000 shots in my career. I've lost almost 300 games. Twenty-six times I've been trusted to take the game-winning shot and missed. I've failed over and over and over again in my life. And that is why I succeed.",
          sport: "Basketball player",
          image: "https://cdn.nba.com/manage/2021/08/michael-jordan-looks.jpg"),
      ContentLoginRegisterModel(
          actor: "Michael Jordan ",
          content:
              "I've missed more than 9,000 shots in my career. I've lost almost 300 games. Twenty-six times I've been trusted to take the game-winning shot and missed. I've failed over and over and over again in my life. And that is why I succeed.",
          sport: "Basketball player",
          image: "https://cdn.nba.com/manage/2021/08/michael-jordan-looks.jpg"),
      ContentLoginRegisterModel(
          actor: "Michael Jordan ",
          content:
              "I've missed more than 9,000 shots in my career. I've lost almost 300 games. Twenty-six times I've been trusted to take the game-winning shot and missed. I've failed over and over and over again in my life. And that is why I succeed.",
          sport: "Basketball player",
          image: "https://cdn.nba.com/manage/2021/08/michael-jordan-looks.jpg"),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: MainBackground(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  LinearLoginRegisterSport(newsItems: newsItems),
                  Expanded(
                    child: Container(
                      width: double.infinity,
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 27, vertical: 30),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const LoginForm(),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    const Expanded(
                                        child: Divider(color: Colors.grey)),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        "or",
                                        style:
                                            TextStyle(color: Colors.grey[400]),
                                      ),
                                    ),
                                    const Expanded(
                                        child: Divider(color: Colors.grey)),
                                  ],
                                ),
                                const SizedBox(height: 20),

                                // Google
                                SocialLoginButton(
                                  text: 'Login with Google',
                                  iconAsset: 'assets/svgs/google.svg',
                                  onPressed: () {
                                    print("Google login");
                                  },
                                ),
                                const SizedBox(height: 12),

                                // Facebook
                                SocialLoginButton(
                                  text: 'Login with Facebook',
                                  iconAsset: 'assets/svgs/face.svg',
                                  onPressed: () {
                                    print("Facebook login");
                                  },
                                ),
                                const SizedBox(height: 12),

                                // Apple
                                // SocialLoginButton(
                                //   text: 'Login with Apple',
                                //   iconAsset: 'assets/svgs/apple.svg',
                                //   onPressed: () {
                                //     print("Apple login");
                                //   },
                                // ),
                                const SizedBox(height: 20),

                                const Row(
                                  children: [
                                    Expanded(
                                      child: Divider(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),

                                Center(
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "First time here? ",
                                          style: TextStyle(
                                            color: resources.colors.primaryText,
                                            fontSize:
                                                resources.sizes.textNormal,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "Sign up for free",
                                          style: TextStyle(
                                            color: resources.colors.primary,
                                            fontSize:
                                                resources.sizes.textNormal,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              print("Navigate to Sign up");
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
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
