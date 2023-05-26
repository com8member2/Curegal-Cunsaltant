import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../shared/shared_small_widgets.dart';
import '../../utility/utility.dart';
import '../../../routing/app_routes.dart';
import '../../../utility/utility.dart';

class Categories extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarH("Physical Fitness",context),
      body: Column(
        children: [
          // CommonAppBar(title: "Physical Fitness"),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.consultationDoctorsList);
                      },
                      horizontalTitleGap: 0,
                      leading: Icon(Icons.man),
                      title: Text("Body Transformation",
                          style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
                      trailing: Icon(Icons.arrow_forward_ios_rounded,size: 20),
                    ),
                    Divider(
                      color: Colors.black, indent: 20, endIndent: 15, height: 0,)
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
