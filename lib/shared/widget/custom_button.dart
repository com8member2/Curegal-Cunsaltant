import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final String text;
  final VoidCallback onTap;
  final double borderRadius;
  final double borderWidth;
  final double width;

  const CustomButton(this.color, this.backgroundColor, this.text, this.onTap, this.borderRadius, this.borderWidth, this.width);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height/15,
      width: width,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
          side: BorderSide(width: borderWidth, color: Colors.transparent),
          backgroundColor: backgroundColor,
          foregroundColor: color,
          padding: const EdgeInsets.all(16.0),
          textStyle: const TextStyle(fontSize: 16),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(fontFamily: "productsun", fontWeight: FontWeight.bold,fontSize: 18),
        ),
      ),
    );
  }
}