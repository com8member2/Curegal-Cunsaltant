import 'package:flutter/material.dart';

class SeeAllHeading extends StatelessWidget {
  const SeeAllHeading(this.title, {Key? key, this.onSeeAllClick}) : super(key: key);
  final String title;
  final VoidCallback? onSeeAllClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          if (onSeeAllClick != null) GestureDetector(onTap: onSeeAllClick, child: const Text("View All", style: TextStyle(color: Colors.pink,fontWeight: FontWeight.w500)))
        ],
      ),
    );
  }
}
