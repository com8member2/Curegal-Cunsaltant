
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConsultationItem extends StatelessWidget {
  final VoidCallback? onClick;
  String name;
  String imageUrl;
  String txtColor;

  ConsultationItem({this.onClick, Key? key, required this.name, required this.imageUrl,required this.txtColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String colorValue = txtColor;
    Color color = Color(int.parse(colorValue.substring(1, 7), radix: 16) + 0xFF000000);

    return InkWell(
      onTap: onClick,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            SvgPicture.network(
              imageUrl,
              fit: BoxFit.fill,
              width: 10,
              height: MediaQuery.of(context).size.height / 5,
            ),
            SizedBox(
              width: 80,
              child: Padding(
                padding: EdgeInsets.only(left: 10, top: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maxLines: 1,
                      name.split(" ")[0],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: color),
                    ), if(name.split(" ").length > 1)Text(
                      maxLines: 1,
                      name.split(" ")[1],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14, color: color),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}