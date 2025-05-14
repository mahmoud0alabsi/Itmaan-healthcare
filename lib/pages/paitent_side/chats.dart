// // ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:my_tasks/models/users.dart';

// import 'dart:math';
// import 'package:my_tasks/models/conversations.dart';
// import 'widgets/chat_bubble.dart';
// import 'package:my_tasks/models/messages_data.dart';

// class Chats extends StatefulWidget {
//   final Users patient;
//   const Chats({super.key, required this.patient});

//   @override
//   _ChatsState createState() => _ChatsState(patient);
// }

// class _ChatsState extends State<Chats>
//      {
//   final TextEditingController msg_controller = TextEditingController();

//   Users patient;
//   _ChatsState(this.patient);

//   static Random random = Random();
//   String name = names[random.nextInt(10)];

//   // Microhpone button - will change to send button
//   IconButton _affectedByStateChange = IconButton(
//     icon: const Icon(
//       Icons.mic,
//       color: Color.fromRGBO(255, 145, 49, 1),
//     ),
//     onPressed: () {},
//   );

//   @override
//   Widget build(BuildContext context) {
//     _thisWillAffectTheStateOfRecorButton() {
//       _affectedByStateChange = IconButton(
//         icon: const Icon(
//           Icons.send,
//           color: Color.fromRGBO(46, 138, 199, 1),
//           // size: 30.0,
//         ),
//         color: Colors.blueGrey,
//         // iconSize: 30.0,
//         onPressed: () {
//           if (msg_controller.text.isNotEmpty) {
//             setState(() {
//               create_add_message_to_conversation(
//                   AllPatientUsers[widget.patient.patient_id].ConversationChatID,
//                   patient.patient_id,
//                   "patient",
//                   0,
//                   "medical_staff",
//                   msg_controller.text);
//               msg_controller.clear();
//             });
//           }
//         },
//       );
//     }

//     int patientId = patient.patient_id;

//     // super.build(context);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.5,
//         automaticallyImplyLeading: false,
//         titleSpacing: 0.0,
//         title: Center(
//             child: Text("المحادثة",
//                 style: GoogleFonts.arefRuqaa(
//                     color: const Color.fromRGBO(29, 93, 155, 1),
//                     fontSize: 30))),
//       ),
//       body: SizedBox(
//         height: MediaQuery.of(context).size.height,
//         child: Column(
//           children: <Widget>[
//             Flexible(
//               child: ListView.builder(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 itemCount: AllConversationsChats[
//                         AllPatientUsers[patientId].ConversationChatID]
//                     .messages
//                     .length,
//                 reverse: true,
//                 itemBuilder: (BuildContext context, int index) {
//                   Message msg = AllConversationsChats[
//                           AllPatientUsers[patientId].ConversationChatID]
//                       .messages[index];
//                   return ChatBubble(
//                     message: msg.message_content,
//                     username: msg.sender_role == "medical_staff"
//                         ? "${AllStaffUsers[msg.sender_id].f_name} ${AllStaffUsers[msg.sender_id].l_name}"
//                         : "${AllPatientUsers[patientId].f_name} ${AllPatientUsers[patientId].l_name}",
//                     time: get_messag_date(msg.created_at),
//                     type: "text",
//                     replyText: "reply text",
//                     isMe: msg.sender_role == "patient" ? true : false,
//                     isGroup: false,
//                     isReply: false, // Always false please
//                     replyName: "replyName",
//                   );
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 5.0),
//               child: Expanded(
//                 child: Align(
//                   alignment: Alignment.bottomCenter,
//                   child: BottomAppBar(
//                     elevation: 10,
//                     color: Colors.white,
//                     child: Container(
//                       margin: const EdgeInsets.only(
//                         bottom: 1,
//                       ),
//                       constraints: const BoxConstraints(
//                         maxHeight: 50,
//                       ),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: <Widget>[
//                           IconButton(
//                             icon: const Icon(
//                               Icons.add,
//                               color: Color.fromRGBO(46, 138, 199, 1),
//                             ),
//                             onPressed: () {},
//                           ),
//                           Flexible(
//                             child: Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(vertical: 5.0),
//                               child: TextField(
//                                 controller: msg_controller,
//                                 style: const TextStyle(
//                                   fontSize: 15.0,
//                                   color: Color.fromARGB(255, 0, 0, 0),
//                                 ),
//                                 decoration: InputDecoration(
//                                   contentPadding: const EdgeInsets.symmetric(
//                                       vertical: 3.0, horizontal: 10.0),

//                                   // border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
//                                   focusedBorder: OutlineInputBorder(
//                                       borderRadius:
//                                           BorderRadius.circular(25.0)),

//                                   // enabledBorder: InputBorder.none,
//                                   hintText: "اكتب الرسالة هنا...",
//                                   hintStyle: const TextStyle(
//                                     fontSize: 15.0,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 maxLines: null,

//                                 onTap: () {
//                                   setState(() {
//                                     _thisWillAffectTheStateOfRecorButton();
//                                   });
//                                 }, //changing icon//change icon type
//                               ),
//                             ),
//                           ),

//                           _affectedByStateChange //changing icon
//                           //changing icon
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // @override
//   // bool get wantKeepAlive => true;

//   String get_messag_date(DateTime date) {
//     return "${date.hour}:${date.minute}  ${date.month}/${date.day}";
//   }
// }

// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_tasks/models/users.dart';

import 'package:my_tasks/models/conversations.dart';
import 'widgets/chat_bubble.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';


class Chats extends StatefulWidget {
  final Users patient;
  const Chats({super.key, required this.patient});

  @override
  _ChatsState createState() => _ChatsState(patient);
}

class _ChatsState extends State<Chats> {
  final TextEditingController msg_controller = TextEditingController();

  Users patient;
  _ChatsState(this.patient);

  // Microhpone button - will change to send button
  IconButton _affectedByStateChange = new IconButton(
    icon: const Icon(
      Icons.mic,
      color: Color.fromRGBO(255, 145, 49, 1),
    ),
    onPressed: () {},
  );


    void handleClick_media(int item) {
      switch (item) {
        case 0:
          
          break;
        case 1:
         
          break;
      }
    }

  @override
  Widget build(BuildContext context) {
    _thisWillAffectTheStateOfRecorButton() {
      _affectedByStateChange = IconButton(
        icon: const Icon(
          Icons.send,
          color: Color.fromRGBO(46, 138, 199, 1),
          // size: 30.0,
        ),
        color: Colors.blueGrey,
        // iconSize: 30.0,
        onPressed: () {
          if (msg_controller.text.isNotEmpty) {
            int index = AllPatientUsers[patient.patient_id].ConversationChatID;

            if (AllConversationsChats[index].is_blocked == false &&
                AllConversationsChats[index].send_count == 1) {
              setState(() {
                create_add_message_to_conversation(
                    AllPatientUsers[patient.patient_id].ConversationChatID,
                    patient.patient_id,
                    "patient",
                    0,
                    "medical_staff",
                    msg_controller.text);
                msg_controller.clear();
              });

              AllConversationsChats[index].is_blocked = true;
              AllConversationsChats[index].send_count = 0;

              AllConversationsChats[index].unread_msgs++;

            } else if (AllConversationsChats[index].is_blocked &&
                AllConversationsChats[index].send_count == 0) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Directionality(
                      textDirection: TextDirection.rtl,
                      child: AlertDialog(
                        content: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.lock_clock_outlined,
                              size: 40,
                              color: Color.fromRGBO(46, 138, 199, 1),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "يرجى انتظار موافقة اجراء محادثة من قبل أحد أفراد الكادر الطبي.",
                              style: TextStyle(
                                color: Color.fromRGBO(29, 93, 155, 1),
                              ),
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.only(left:14, bottom: 14),
                              child: const Text("إغلاق"),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            } else if (AllConversationsChats[index].is_blocked == false) {
              setState(() {
                create_add_message_to_conversation(
                    AllPatientUsers[patient.patient_id].ConversationChatID,
                    patient.patient_id,
                    "patient",
                    0,
                    "medical_staff",
                    msg_controller.text);
                msg_controller.clear();

                AllConversationsChats[index].unread_msgs++;
              });
            }
          }
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        automaticallyImplyLeading: false,
        titleSpacing: 0.0,
        title: Center(
            child: Text("المحادثة",
                style: GoogleFonts.arefRuqaa(
                    color: const Color.fromRGBO(29, 93, 155, 1),
                    fontSize: 30))),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            
            Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: AllConversationsChats[patient.ConversationChatID]
                    .messages
                    .length,
                reverse: true,
                itemBuilder: (BuildContext context, int index) {
                  Message msg =
                      AllConversationsChats[patient.ConversationChatID]
                          .messages[index];
                  return ChatBubble(
                    message: msg.message_content,
                    username: msg.sender_role == "medical_staff"
                        ? "${AllStaffUsers[msg.sender_id].f_name} ${AllStaffUsers[msg.sender_id].l_name}"
                        : "${AllPatientUsers[patient.patient_id].f_name} ${AllPatientUsers[patient.patient_id].l_name}",
                    time: get_messag_date(msg.created_at),
                    type: "text",
                    replyText: "reply text",
                    isMe: msg.sender_role == "patient" ? true : false,
                    isGroup: false,
                    isReply: false, // Always false please
                    replyName: "replyName",
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomAppBar(
                elevation: 10,
                color: Colors.white,
                child: Container(
                  constraints: const BoxConstraints(
                    maxHeight: 50,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[

                                              Directionality(
                              textDirection: TextDirection.rtl,
                               child: PopupMenuButton<int>(
                                icon: Icon(Icons.add),
                                tooltip: "قائمة المرفقات",
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0))),
                                offset: Offset(-15.0, -130.0),
                                onSelected: (item) => handleClick_media(item),
                                itemBuilder: (context) => [
                                  PopupMenuItem<int>(
                                    value: 0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(
                                          Icons.image,
                                          color: Color.fromARGB(255, 79, 0, 250),
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      showTopSnackBar(
                                        Overlay.of(context),
                                        CustomSnackBar.success(
                                          icon: Icon(Icons.update_rounded,
                                              color: Color(0x15000000),
                                              size: 120),
                                          message: "قريبا",
                                        ),
                                      );
                                    },
                                  ),
                                  PopupMenuItem<int>(
                                    value: 1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(
                                          Icons.attach_file_outlined,
                                          color: Color.fromARGB(255, 0, 120, 0),
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      showTopSnackBar(
                                        Overlay.of(context),
                                        CustomSnackBar.success(
                                          icon: Icon(Icons.update_rounded,
                                              color: Color(0x15000000),
                                              size: 120),
                                          message: "قريبا",
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),


                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: TextField(
                            controller: msg_controller,
                            style: const TextStyle(
                              fontSize: 15.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 3.0, horizontal: 10.0),

                              // border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0)),

                              // enabledBorder: InputBorder.none,
                              hintText: "اكتب الرسالة هنا...",
                              hintStyle: const TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                            ),
                            maxLines: null,

                            onTap: () {
                              setState(() {
                                _thisWillAffectTheStateOfRecorButton();
                              });
                            }, //changing icon//change icon type
                          ),
                        ),
                      ),

                      _affectedByStateChange //changing icon
                      //changing icon
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }

  String get_messag_date(DateTime date) {
    return "${date.hour}:${date.minute}  ${date.month}/${date.day}";
  }
}
