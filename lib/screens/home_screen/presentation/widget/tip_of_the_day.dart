import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../consatant/ColorConstant.dart';
import '../../../../shared/custom_image_view.dart';
import '../../../../utility/utility.dart';

class TipOfTheDay extends StatelessWidget {
  const TipOfTheDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Future<List<dynamic>> healthTipsData() async {
      PostgrestResponse<dynamic> res = await readData("health_tip_of the_day");
      return res.data as List<dynamic>;
    }

    return FutureBuilder(future :healthTipsData(),builder: (context, snapshot) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 18, right: 18),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
          child: Stack(
            children: [
              CustomImageView(url: snapshot.data?[0]['bg_image'], fit: BoxFit.scaleDown),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr(context).tip_of_the_day ?? "",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: HexColor.fromHex("${snapshot.data?[0]['text_colour']}")),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 45),
                      child: Text.rich(
                          maxLines: 4,
                          style: const TextStyle(height: 1.3),
                          TextSpan(
                              text: snapshot.data?[0]['description'],
                              style: TextStyle(color:HexColor.fromHex("${snapshot.data?[0]['text_colour']}"), fontSize: 16, fontWeight: FontWeight.w400),
                              children: [const TextSpan(text: "Read More", style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline))])),
                    ),

                    /*const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      // Add your button functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 7),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.share_sharp, color: CustomColor.darkGreen, size: 18),
                          const SizedBox(width: 10),
                          Text(
                            'Share',
                            style: TextStyle(
                              color: CustomColor.darkGreen,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )*/
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },);
  }
}
