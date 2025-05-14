// // ignore_for_file: unnecessary_new

// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:my_tasks/widgets/chat_bubble.dart';
// import 'package:my_tasks/models/messages_data.dart';

// // import 'package:my_tasks/models/users.dart';
// // import 'models/status_conversations.dart';
// import 'package:my_tasks/models/conversations.dart';


// class Conversation extends StatefulWidget {
//   const Conversation({super.key});

//   @override
//   _ConversationState createState() => _ConversationState();
// }

// class _ConversationState extends State<Conversation> {
//   static Random random = Random();
//   String name = names[random.nextInt(10)];

//   // Microhpone button - will change to send button
//   IconButton _affectedByStateChange = new IconButton(
//     icon: const Icon(
//       Icons.mic,
//       color: Color.fromRGBO(255, 145, 49, 1),
//     ),
//     onPressed: () {
//     },
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
//         },
//       );
      
//     }

//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: const Color.fromRGBO(46, 138, 199, 1),
//           elevation: 3,
//           leading: IconButton(
//               icon: const Icon(
//                 Icons.keyboard_backspace,
//               ),
//               onPressed: () {
//                 if (Navigator.canPop(context)) {
//                   Navigator.pop(context);
//                 }
//               }),
//           titleSpacing: 0,
//           title: InkWell(
//             child: Row(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.only(left: 0.0, right: 10.0),
//                   child: CircleAvatar(
//                     backgroundImage: AssetImage(
//                       "assets/images/cm${random.nextInt(10)}.jpeg",
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 0.0, right: 10.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           name,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14,
//                           ),
//                         ),
//                         // const SizedBox(height: 2),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             onTap: () {
//             },
//           ),
//           actions: <Widget>[
//             IconButton(
//               icon: const Icon(
//                 Icons.more_vert,
//               ),
//               onPressed: () {},
//             ),
//           ],
//         ),
        
//         body: SizedBox(
//           height: MediaQuery.of(context).size.height,
//           child: Column(
//             children: <Widget>[
//               Flexible(
//                 child: ListView.builder(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   itemCount: conversation.length,
//                   reverse: true,
//                   itemBuilder: (BuildContext context, int index) {
//                     Map msg = conversation[index];
//                     return ChatBubble(
//                       message: msg['type'] == "text"
//                           ? messages[random.nextInt(10)]
//                           : "assets/images/cm${random.nextInt(10)}.jpeg",
//                       username: msg["username"],
//                       time: msg["time"],
//                       type: msg['type'],
//                       replyText: msg["replyText"],
//                       isMe: msg['isMe'],
//                       isGroup: msg['isGroup'],
//                       isReply: msg['isReply'],
//                       replyName: name,
//                     );
//                   },
//                 ),
//               ),
              
              
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: BottomAppBar(
//                   elevation: 10,
//                   color: Colors.white,
//                   child: Container(
//                     constraints: const BoxConstraints(
//                       maxHeight: 50,
//                     ),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: <Widget>[
//                         IconButton(
//                           icon: const Icon(
//                             Icons.add,
//                             color: Color.fromRGBO(46, 138, 199, 1),
//                           ),
//                           onPressed: () {
//                           },
//                         ),
//                         Flexible(
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 5.0),
//                             child: TextField(
//                               style: const TextStyle(
//                                 fontSize: 15.0,
//                                 color: Color.fromARGB(255, 0, 0, 0),
//                               ),
//                               decoration: InputDecoration(
//                                 contentPadding: const EdgeInsets.symmetric(
//                                     vertical: 3.0, horizontal: 10.0),

//                                 // border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
//                                 focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(25.0)),

//                                 // enabledBorder: InputBorder.none,
//                                 hintText: "اكتب الرسالة هنا...",
//                                 hintStyle: const TextStyle(
//                                   fontSize: 15.0,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               maxLines: null,

//                               onTap: () {
//                                 setState(() {
//                                   _thisWillAffectTheStateOfRecorButton();
//                                 });
//                               }, //changing icon//change icon type
//                             ),
//                           ),
//                         ),

//                         _affectedByStateChange //changing icon
//                         //changing icon
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
      
//       ),
//     );
//   }

// }
