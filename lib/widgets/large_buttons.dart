import 'package:flutter/material.dart';
import 'package:payment_app/component/colors.dart';

class AppLargeButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final String text;
  final Function()? onTap;
  final bool? isBorder;

  const AppLargeButton({
    super.key,
    this.backgroundColor = AppColor.mainColor,
    this.textColor = Colors.white,
    this.onTap,
    this.isBorder = false,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        height: 60,
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: AppColor.mainColor,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 30,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
