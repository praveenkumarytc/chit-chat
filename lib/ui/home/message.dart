import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  final String name;
  final String imageUrl;
  final String lastMessage;
  const Message(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.lastMessage});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new)),
            leadingWidth: 25,
            elevation: 0,
            title: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    widget.imageUrl,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(widget.name),
              ],
            )),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * .8),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: Text(widget.lastMessage),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        extendBody: true,
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  style: TextStyle(color: Colors.blue),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.grey.shade500),
                      ),
                      contentPadding: EdgeInsets.only(
                          top: 13, bottom: 13, left: 15, right: 15),
                      hintText: "type your messages",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.amber,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
