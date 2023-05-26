
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

import '../../../consatant/ColorConstant.dart';
import '../../../routing/app_routes.dart';
import '../../../utility/utility.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/custom_image_view.dart';
import '../../home_screen/presentation/widget/custom_textfield.dart';

class AddFamilyDialogBox extends HookWidget {
  const AddFamilyDialogBox({super.key});

  @override
  Widget build(BuildContext context) {

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(vertical: 20,horizontal:20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: const Color(0xffFFFFFF),
      child: SingleChildScrollView(
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Add Family Member",
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Relationship",
                          style: TextStyle(fontWeight: FontWeight.w500)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CommonFamilyMember(),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Name",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: CustomTextField("Enter Name"),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Date Of Birth",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const Date(),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Mobile Number",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: CustomTextField("Enter Mobile Number"),
                    ),
                    const CheckBoxRow(),
                    CustomButton(CustomColor.white, CustomColor.primaryPurple, tr(context).submit, () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            content: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height / 4,
                                child: Column(children: [
                                  CustomImageView(imagePath: "assets/images/videocall_option.png",),
                                  const SizedBox(height: 10,),
                                  Text(tr(context).are_you_sure,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,fontFamily: "productsun"),),
                                  const SizedBox(height: 10,),
                                  Text(tr(context).confirm_request,style: const TextStyle(fontSize: 14,fontFamily: "productsun",color: CustomColor.txtGray),),
                                  const SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Text(tr(context).patient_contact_number,style: const TextStyle(fontSize: 14,fontFamily: "productsun",color: CustomColor.txtGray),),
                                      const Text("+91 7878787878",style: TextStyle(fontSize: 14,fontFamily: "productsun",color: CustomColor.primaryPurple),),
                                      const SizedBox(width: 5,),
                                      CustomImageView(imagePath: "assets/images/edit.png",)
                                    ],
                                  ),
                                  const Spacer(),
                                  CustomButton(CustomColor.white, CustomColor.primaryPurple, tr(context).submit, () {
                                    Navigator.pushNamed(context, AppRoutes.consultationChatScreen);
                                  }, 10, 1, MediaQuery.of(context).size.width)
                                ])),
                          );
                        },
                      );
                    }, 10, 1, MediaQuery.of(context).size.width)
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
class Date extends HookWidget {
  const Date({super.key});

  @override
  Widget build(BuildContext context) {
    final dayController = useTextEditingController(text: null);
    final monthController = useTextEditingController(text: null);
    final yearController = useTextEditingController(text: null);

    var controllerList = [dayController, monthController, yearController];
    final List<String> data = ["DD", "MM", "YYYY"];

    return SizedBox(
      height: 85,
      child: ListView.builder(
        itemCount: data.length,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, int index) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  Container(
                    width: data[index].contains("YYYY") ? 80 : 50,
                    height: 45,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: const Color(0x20686868)),
                    child: TextField(
                        controller: controllerList[index],
                        onTap: () async {
                          DateTime? pickDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              builder: (context, child) {
                                return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: const ColorScheme.light(
                                        primary: Color(0xff8377ec),
                                        onPrimary: Colors.white,
                                        onSurface: Colors.black,
                                      ),
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                          foregroundColor: Colors.black, // button text color
                                        ),
                                      ),
                                    ),
                                    child: child!);
                              },
                              firstDate: DateTime(DateTime.now().year - 150),
                              lastDate: DateTime.now());
                          if (pickDate != null) {
                            dayController.text = DateFormat("dd").format(pickDate);
                            monthController.text = DateFormat("MM").format(pickDate);
                            yearController.text = DateFormat("yyyy").format(pickDate);
                          }
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        keyboardType: TextInputType.none,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(data[index], style: const TextStyle(color: Color(0xff828282), letterSpacing: 1)),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CommonFamilyMember extends HookWidget {
  CommonFamilyMember({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _choices = ['Father', 'Mother', 'Brother', 'Sister'];
    var _selectedIndex = useState<int?>(null);
    void _selectChoice(int? index) {
      _selectedIndex.value = index;
    }

    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: _choices.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ChoiceChip(
                avatarBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                labelPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                label: Text(_choices[index],
                    style: TextStyle(
                        color: _selectedIndex.value == index
                            ? Colors.white
                            : Colors.black)),
                selected: _selectedIndex.value == index,
                selectedColor: const Color(0xff8377ec),
                avatar: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                        color: Colors.white,
                        child: CustomImageView(imagePath:
                        "assets/images/father.png",
                          fit: BoxFit.fill,
                        ))),
                backgroundColor: const Color(0xffF6F5FD),
                onSelected: (value) {
                  if (value) {
                    _selectChoice(index);
                  } else {
                    _selectChoice(null);
                  }
                }),
          );
        },
      ),
    );
  }
}
class CheckBoxRow extends HookWidget {
  const CheckBoxRow({super.key});

  @override
  Widget build(BuildContext context) {
    var _selected = useState<bool>(false);
    return Row(
      children: [
        Transform.scale(
          scale: 0.9,
          child: InputChip(
            materialTapTargetSize: MaterialTapTargetSize.padded,
            avatar: const Icon(Icons.check, color: Colors.white),
            shape: const CircleBorder(),
            label: const SizedBox(),
            padding: const EdgeInsets.only(left: 15),
            selected: _selected.value,
            selectedColor:
            _selected.value ? const Color(0xff8377ec) : const Color(0x20686868),
            onSelected: (value) {
              _selected.value = value;
            },
          ),
        ),
        Flexible(
            child: GestureDetector(
              onTap: () {
                _selected.value = !_selected.value;
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 8.0, bottom: 8, top: 8),
                child: Text("I am lawfully authorized to provide the above information on behalf of the owner of profile"),
              ),
            ))
      ],
    );
  }
}
