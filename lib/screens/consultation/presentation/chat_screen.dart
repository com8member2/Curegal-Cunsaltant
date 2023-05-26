import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../consatant/ColorConstant.dart';
import '../../../routing/app_routes.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/custom_image_view.dart';
import '../../../utility/utility.dart';

class ChatScreen extends HookWidget {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _messages = useState<List<Message>>([
      Message(
          text:
              'Hbvdkvj jhfjds jfhefch hfsjjsnibc dhfihsdiui Hbvdkvj jhfjds jfhefch hfsjjsnibc dhfihsdiui Hbvdkvj jhfjds jfhefch hfsjjsnibc dhfihsdiui Hbvdkvj jhfjds jfhefch hfsjjsnibc dhfihsdiui',
          isMe: false),
      Message(text: 'Hbvdkvj jhfjds jfhefch hfsjjsnibc dhfihsdiui', isMe: false),
      Message(text: 'Hi', isMe: false),
      Message(text: 'Hello', isMe: true),
      Message(text: 'How are you?', isMe: true),
      Message(text: 'I am doing great. Thanks for asking!', isMe: false),
    ]);

    var isChatEnded = useState(false);

    void _handleSubmitted(String text) {
      _textController.clear();
      Message message = Message(text: text, isMe: true);
      _messages.value.add(message);
      _messages.notifyListeners();
      print("list ${_messages.value} & ${_messages.value.length}");
    }

    return Scaffold(
      backgroundColor: CustomColor.lightGray100,
      appBar: AppBar(
          leading: Icon(
            Icons.arrow_back_ios,
            color: CustomColor.darkGray,
            size: 20,
          ),
          toolbarHeight: MediaQuery.of(context).size.height / 10,
          backgroundColor: CustomColor.white,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.chatsummaryScreen);
                },
                child: Row(children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 25.0,
                        backgroundImage: AssetImage('assets/images/Rectangle100228.png'),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 10.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            color: CustomColor.mediumGreen,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Dr. Lane Holden",
                          style: TextStyle(color: CustomColor.black, fontSize: 14, fontFamily: "productsun", fontWeight: FontWeight.w700)),
                      SizedBox(
                        height: 5,
                      ),
                      Text("MA, PGDCA",
                          style: TextStyle(color: CustomColor.black, fontSize: 12, fontFamily: "productsun", fontWeight: FontWeight.w500)),
                    ],
                  ),
                ]),
              ),
              Spacer(),
              CustomImageView(
                fit: BoxFit.fill,
                imagePath: "assets/images/audio.png",
                height: 20,
                width: 25,
              ),
              SizedBox(
                width: 30,
              ),
              GestureDetector(
                onTap: () {
                  isChatEnded.value = !isChatEnded.value;
                },
                child: CustomImageView(
                  fit: BoxFit.fill,
                  imagePath: "assets/images/video.png",
                  height: 20,
                  width: 30,
                ),
              ),
            ],
          )),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemBuilder: (_, int index) => _messages.value[index],
              itemCount: _messages.value.length,
            ),
          ),
          //ChatWithConsultant2(),
          const Divider(height: 1.0),
          ValueListenableBuilder(
            valueListenable: isChatEnded,
            builder: (context, bool value, child) {
              return value
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 5,
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, right: 30),
                          child: Text(textAlign: TextAlign.center,
                            "Your consultation with Dr. Lane Holden has ended",
                            style: TextStyle(color: Colors.red, fontSize: 16),
                            maxLines: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
                          child: CustomButton(CustomColor.white, CustomColor.primaryPurple, "Book Another Consultation", () {}, 10, 1,
                              MediaQuery.of(context).size.width),
                        )
                      ]),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                      ),
                      child: IconTheme(
                        data: IconThemeData(color: CustomColor.primaryPurple),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.add_circle_sharp,
                                size: 30,
                                color: CustomColor.primaryPurple,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: TextField(
                                  controller: _textController,
                                  onSubmitted: _handleSubmitted,
                                  decoration: const InputDecoration.collapsed(hintText: 'Write a message'),
                                ),
                              ),
                              Icon(
                                Icons.insert_emoticon_sharp,
                                size: 25,
                                color: CustomColor.mediumGray,
                              ),
                              SizedBox(
                                child: IconButton(
                                  icon: const Icon(Icons.send),
                                  onPressed: () {
                                    _handleSubmitted(_textController.text);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}

class Message extends HookWidget {
  const Message({required this.text, required this.isMe});

  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(width: isMe ? MediaQuery.of(context).size.width / 2.5 : 10.0),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 15.0,
              ),
              decoration: BoxDecoration(
                color: isMe ? CustomColor.primaryPurple : CustomColor.deepPurpleMsg,
                borderRadius: isMe
                    ? BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                    : BorderRadius.only(topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
              ),
              child: Text(
                text,
                style: TextStyle(color: isMe ? CustomColor.white : CustomColor.black),
              ),
            ),
          ),
          SizedBox(width: isMe ? 10.0 : MediaQuery.of(context).size.width / 2.5),
        ],
      ),
    );
  }
}
