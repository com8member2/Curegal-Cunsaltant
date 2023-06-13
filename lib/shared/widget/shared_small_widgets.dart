import 'package:consultation_curegal/shared/widget/textfield_decoration.dart';
import 'package:consultation_curegal/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../consatant/ColorConstant.dart';


class DividerLightPink extends StatelessWidget {
  const DividerLightPink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 10,
      color: CustomColor.lightGry,
    );
  }
}
class CommonRating extends HookConsumerWidget {
  const CommonRating({super.key, required this.padding, this.color = CustomColor.mediumGreen, this.flag = true});

  final EdgeInsetsGeometry padding;
  final Color color;
  final bool flag;

  @override
  Widget build(BuildContext context,ref) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          flag ? const Icon(Icons.star, color: Colors.white, size: 15) : const Text("75%", style: TextStyle(color: Colors.white, fontFamily: "intersemibold")),
          const SizedBox(
            width: 3,
          ),
          flag
              ? const Text(
            "92%",
            style: TextStyle(color: Colors.white),
          )
              : const Text(
            "OFF",
            style: TextStyle(fontFamily: "intersemibold", color: Colors.white),
          )
        ],
      ),
    );
  }
}
Widget screenHeadingSubtitle(String? heading, String subtitle) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if(heading !=null)
      const SizedBox(
        height: 20,
      ),
      if(heading !=null)
      Text(
        heading,
        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, fontFamily: "productsun"),
      ),
      const SizedBox(
        height: 20,
      ),
      Text(
        subtitle,
        style: const TextStyle(
          fontFamily: "productsun",
          fontSize: 17,
          color: CustomColor.textBlack,
        ),
      ),
    ],
  );
}

PreferredSizeWidget customAppBarH(String heading, BuildContext context,
    {Color? backgroundColor = Colors.transparent, Color? textColor = CustomColor.black, bool isShawBack = true, List<Widget>? actions, double? toolbarHeight}) {
  return AppBar(
    titleSpacing: isShawBack ? 20 : 30,
    title: Text(heading,style: const TextStyle(fontSize: 24)),
    actions: actions,
    elevation: 0,
    toolbarHeight: toolbarHeight,
    leadingWidth: 40,
    backgroundColor: backgroundColor,
    titleTextStyle: TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.bold),
    leading: isShawBack ? Align( alignment: Alignment.centerRight,child: GestureDetector(onTap: () => Navigator.pop(context), child: Icon(Icons.arrow_back_ios_rounded, color: textColor))) : null,
  );
}

class TextFieldWithLable extends StatelessWidget {

  final String text ;
  final String textfieldHinttext ;
  final double textfieldWidth;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final bool isEnable;


  const TextFieldWithLable(this.text,this.textfieldHinttext,this.textfieldWidth,this.controller,this.validator,{super.key, this.keyboardType=TextInputType.text,this.isEnable=true});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
      Text(text,style: commonTextStyle(context, 14,FontWeight.normal,CustomColor.txtGray),),
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: SizedBox(
            width: textfieldWidth,
            child: TextFormField(
              controller: controller,
              enabled: isEnable,
              cursorColor: CustomColor.darkPurple,
              decoration: textFieldDecorationForProfile(textfieldHinttext, context),
              validator: validator,
              keyboardType: keyboardType,scrollPadding: EdgeInsets.only(bottom: 110),

            )),
      )
    ],);
  }

}


class CardListViewDesign extends StatelessWidget {
  final VoidCallback onClick;
  final Widget customWidget;
  final EdgeInsetsGeometry? edgeInsets;

  const CardListViewDesign({super.key, required this.onClick, required this.customWidget, this.edgeInsets});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: edgeInsets,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide.none,
        ),
        color: CustomColor.backgroundColor,
        elevation: 10,
        shadowColor: CustomColor.white,
        child: customWidget,
      ),
      onTap: () {
        onClick();
      },
    );
  }
}

class TimeSelectionView extends HookConsumerWidget {
  final Function(TimeOfDay time) onTimeSelected;
  final TimeOfDay? initialTime;
  const TimeSelectionView({this.initialTime, required this.onTimeSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(CustomColor.mediumPurple.withOpacity(0.1)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 5)),
            minimumSize: const MaterialStatePropertyAll(Size(20, 34))),
        onPressed: () async {
          var selectedTime =await  showTimePicker(context: context, initialTime: (initialTime??TimeOfDay.now()));
          if(selectedTime != null){
            onTimeSelected(selectedTime);
          }
        },
        child: Row(
          children: [
            Text((initialTime??TimeOfDay.now()).format(context), style: const TextStyle(color: CustomColor.black, letterSpacing: 0,fontSize: 14)),
            const SizedBox(
              width: 0,
            ),
            const Icon(
              Icons.access_time_filled_sharp,
              size: 17,
              color: CustomColor.black,
            )
          ],
        ));
  }
}
