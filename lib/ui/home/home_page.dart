import 'package:chit_chat/ui/home/message.dart';
import 'package:chit_chat/utils/app_constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ChatUser> messages = [
    ChatUser(
        id: "1",
        name: "Inventics",
        lastMessage: "developers",
        time: "12:22",
        imageUrl:
            "https://cdn2.thecricketgazette.com/uploads/6/2024/09/GettyImages-1802287800-1140x727.jpg"),
    ChatUser(
        id: "2",
        name: "IOS",
        lastMessage: "Atiq",
        time: "2:30",
        imageUrl:
            "https://digitional.com/wp-content/uploads/2021/01/Vector-Art-Featured.jpg"),
    ChatUser(
        id: "3",
        name: "widows",
        lastMessage: "update your window",
        time: "4:11",
        imageUrl:
            "https://cdn.shopify.com/s/files/1/1999/7417/files/birdvector_grande.png?v=1535471658"),
    ChatUser(
        id: "4",
        name: "Linux",
        lastMessage: "install linux",
        time: "12:33",
        imageUrl:
            "https://www.zentyal.com/wp-content/uploads/2024/02/Linux-operating-system.png"),
    ChatUser(
        id: "5",
        name: "debiyan",
        lastMessage: "new message",
        time: "1:00",
        imageUrl:
            "https://www.stackscale.com/wp-content/uploads/2022/08/debian-gnu-linux-distro-stackscale.jpg"),
  ];

  FocusNode searchFocusNode = FocusNode();
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        padding: EdgeInsets.only(top: 30),
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text(
                AppConstants.appName,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              actions: [
                Icon(Icons.qr_code, color: Colors.black),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.camera_alt,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 7,
                ),
                Icon(Icons.more_vert, color: Colors.black),
                SizedBox(
                  width: 7,
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 7,
                  ),
                  TextFormField(
                    controller: searchController,
                    focusNode: searchFocusNode,
                    style: TextStyle(color: Colors.blue),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(13),
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: IconButton(
                            onPressed: () {
                              searchController.clear();
                              searchFocusNode.unfocus();
                            },
                            icon: Icon(Icons.clear)),
                        hintText: "Ask meta AI or Search",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              searchFocusNode.unfocus();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Message(
                                            imageUrl: messages[index].imageUrl,
                                            name: messages[index].name,
                                            lastMessage:
                                                messages[index].lastMessage,
                                          )));
                            },
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(messages[index].imageUrl),
                            ),
                            title: Text(messages[index].name),
                            subtitle: Text(messages[index].lastMessage),
                            trailing: Text(messages[index].time!),
                          );
                        }),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

class ChatUser {
  String id;
  String name;
  String? chatId;
  String lastMessage;
  String time;
  String imageUrl;
  ChatUser(
      {this.chatId,
      required this.id,
      required this.name,
      required this.lastMessage,
      required this.time,
      required this.imageUrl});
}
