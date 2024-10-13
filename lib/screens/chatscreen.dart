import 'package:chatapp/constants.dart';
import 'package:chatapp/models/messagemodel.dart';
import 'package:chatapp/widgets/chatbubble.dart';
import 'package:chatapp/widgets/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Chatscreen extends StatelessWidget {
  static String id = 'Chatscreen';
  CollectionReference messages =
      FirebaseFirestore.instance.collection(messagecollection);
  TextEditingController controller = TextEditingController();
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages
            .orderBy(
              'created at',
              descending: true,
            )
            .snapshots(),
        builder: (context, Snapshot) {
          List<Messagemodel> messagelist = [];
          if (Snapshot.hasData) {
            for (int i = 0; i < Snapshot.data!.docs.length; i++) {
              messagelist.add(Messagemodel.fromjson(Snapshot.data!.docs[i]));
            }
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: primarycolor,
              title:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset(
                  'assets/images/scholar.png',
                  scale: 2,
                ),
                Text(
                  'Chat',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                )
              ]),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      return messagelist[index].id == email
                          ? chatbuble(
                              text: messagelist[index],
                            )
                          : chatbublefriend(
                              text: messagelist[index],
                            );
                    },
                    itemCount: messagelist.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      messages.add({
                        'message': data,
                        'created at': DateTime.now(),
                        'id': email,
                      });
                      controller.clear();
                      _scrollController.animateTo(
                        0, // Scroll to the end
                        duration: Duration(
                            seconds: 1), // Duration of the scroll animation
                        curve: Curves.easeOut, // Animation curve
                      );
                    },
                    decoration: InputDecoration(
                      hintText: 'Send text',
                      suffixIcon: Icon(
                        Icons.send,
                        color: primarycolor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          16,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
