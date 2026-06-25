import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController =
      TextEditingController();

  final List<Map<String, String>> messages = [
    {
      "sender": "Doctor",
      "message": "Hello, how can I help you?"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FF),

      appBar: AppBar(
        title: const Text("Doctor Chat"),
        backgroundColor: Colors.white,
      ),

      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,

              itemBuilder: (context, index) {
                bool isDoctor =
                    messages[index]["sender"] ==
                        "Doctor";

                return Align(
                  alignment: isDoctor
                      ? Alignment.centerLeft
                      : Alignment.centerRight,

                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 10,
                    ),

                    padding: const EdgeInsets.all(12),

                    decoration: BoxDecoration(
                      color: isDoctor
                          ? Colors.white
                          : Colors.blue,

                      borderRadius:
                          BorderRadius.circular(15),
                    ),

                    child: Text(
                      messages[index]["message"]!,
                      style: TextStyle(
                        color: isDoctor
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.all(10),

            child: Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: messageController,

                    decoration:
                        const InputDecoration(
                      hintText: "Type message...",
                      border:
                          OutlineInputBorder(),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                IconButton(
                  icon: const Icon(Icons.send),

                  onPressed: () {
                    if (messageController
                        .text
                        .trim()
                        .isEmpty) {
                      return;
                    }

                    setState(() {
                      messages.add({
                        "sender": "Patient",
                        "message":
                            messageController.text,
                      });
                    });

                    messageController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}