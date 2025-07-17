import 'package:flutter/material.dart';

import '../../constance.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback? onPress;
  final double height;

  CustomButton({
    Key? key,
    required this.onPress,
    this.text = 'Write text ',
    this.color = primaryColor,
    this.height = 60, // default bigger height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: color,
          minimumSize: Size(double.infinity, height),
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: onPress,
        child: CustomText(
          alignment: Alignment.center,
          text: text,
          color: Colors.white,
          maxLine: 2,
        ),
      ),
    );
  }
}
