import 'package:flutter/material.dart';
import 'package:matchingsport/res/enums/button_type.dart';

class BaseButton extends StatelessWidget {
  final bool isLoading;
  final bool isDisabled;
  final String content;
  final Color backgroundColor;
  final Color tintColor;
  final Function onPressed;
  final ButtonType buttonType;

  const BaseButton(
      {super.key,
      this.isLoading = false,
      this.isDisabled = false,
      this.backgroundColor = Colors.blue,
      this.tintColor = Colors.white,
      this.buttonType = ButtonType.large,
      required this.onPressed,
      required this.content});

  @override
  Widget build(BuildContext context) {
    double buttonHeight() {
      switch (buttonType) {
        case ButtonType.large:
          return 60;
        case ButtonType.medium:
          return 50;
        case ButtonType.small:
          return 40;
        default:
          return 60;
      }
    }

    double contentSize() {
      switch (buttonType) {
        case ButtonType.large:
          return 16;
        case ButtonType.medium:
          return 14;
        case ButtonType.small:
          return 12;
        default:
          return 16;
      }
    }

    return GestureDetector(
      onTap: !isDisabled ? onPressed() : null,
      child: Opacity(
        opacity: isLoading || isDisabled ? 0.5 : 1,
        child: Container(
          height: buttonHeight(),
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Center(
            child: isLoading
                ? CircularProgressIndicator(
                    color: tintColor,
                  )
                : Text(content,
                    style: TextStyle(
                        color: tintColor,
                        fontSize: contentSize(),
                        fontWeight: FontWeight.w500)),
          ),
        ),
      ),
    );
  }
}
