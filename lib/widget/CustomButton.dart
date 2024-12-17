import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    required this.text,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.black,
    this.borderRadius = 8.0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Icon(
              Icons.admin_panel_settings,
              size: 30,
            )),
          ],
        ),
      ),
    );
  }
}
