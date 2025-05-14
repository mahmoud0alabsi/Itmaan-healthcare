// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
// import 'package:my_tasks/pages/abd/patient.dart';
import 'widgets/chat_bubble.dart';
// import 'package:google_fonts/google_fonts.dart';

import 'package:my_tasks/models/users.dart';
// import 'models/status_conversations.dart';
import 'package:my_tasks/models/conversations.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Conversation extends StatefulWidget {
  final int patient_id;
  const Conversation({super.key, required this.patient_id});

  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  final TextEditingController msg_controller = TextEditingController();

  var appBarHeight = AppBar().preferredSize.height;

  // Microhpone button - will change to send button
  IconButton _affectedByStateChange = new IconButton(
    icon: const Icon(
      Icons.mic,
      color: Color.fromRGBO(255, 145, 49, 1),
    ),
    onPressed: () {},
  );

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
            setState(() {
              create_add_message_to_conversation(
                  AllPatientUsers[widget.patient_id].ConversationChatID,
                  0,
                  "medical_staff",
                  widget.patient_id,
                  "patient",
                  msg_controller.text);
              msg_controller.clear();
            });
          }
        },
      );
    }

    void handleClick(int item) {
      switch (item) {
        case 0:
          AllConversationsChats[
                  AllPatientUsers[widget.patient_id].ConversationChatID]
              .is_blocked = false;
          break;
        case 1:
          AllConversationsChats[
                  AllPatientUsers[widget.patient_id].ConversationChatID]
              .send_count = 1;
          break;
      }
    }

    
    void handleClick_media(int item) {
      switch (item) {
        case 0:
          
          break;
        case 1:
         
          break;
      }
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 48, 135, 221),
          elevation: 3,
          leading: IconButton(
              icon: const Icon(
                Icons.keyboard_backspace,
              ),
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute<void>(
                  //     builder: (BuildContext context) =>
                  //         const DoctorScreen(),
                  //   ),
                  // );
                }
              }),
          titleSpacing: 0,
          title: InkWell(
            child: Row(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(left: 0.0, right: 10.0),
                  child:
                      // CircleAvatar(
                      //   backgroundImage: AssetImage(
                      //     "assets/images/cm${random.nextInt(10)}.jpeg",
                      //   ),
                      // ),
                      CircleAvatar(
                    backgroundColor: Colors.white, // لون الخلفية للشعار
                    child: Icon(
                      Icons.person,
                      color: Colors.black, // لون الأيقونة باللون الأسود
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${AllPatientUsers[widget.patient_id].f_name} ${AllPatientUsers[widget.patient_id].l_name}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        // const SizedBox(height: 2),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {},
          ),
          actions: <Widget>[
            Directionality(
              textDirection: TextDirection.rtl,
              child: PopupMenuButton<int>(
                tooltip: "قائمة التحكم",
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                offset: Offset(0.0, appBarHeight + 5),
                onSelected: (item) => handleClick(item),
                itemBuilder: (context) => [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.lock_open,
                          color: Colors.black,
                        ),
                        Text('بدأ المحادثة'),
                      ],
                    ),
                    onTap: () {
                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.success(
                          icon: Icon(Icons.done_outline_rounded,
                              color: Color(0x15000000), size: 120),
                          message: "تم بدأ محادثة جديدة بنجاح",
                        ),
                      );
                    },
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.lock_outline,
                          color: Colors.black,
                        ),
                        Text('إغلاق المحادثة'),
                      ],
                    ),
                    onTap: () {
                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.success(
                          icon: Icon(Icons.do_disturb_outlined,
                              color: Color(0x15000000), size: 120),
                          message: "تم إغلاف المحادثة بنجاح",
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              if (AllConversationsChats[
                      AllPatientUsers[widget.patient_id].ConversationChatID]
                  .is_blocked)
                Container(
                  width: double.infinity,
                  color: Color.fromRGBO(255, 73, 73, 1),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "المستخدم بانتظار بدء اجراء محادثة.",
                          style: TextStyle(color: Colors.white),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(46, 138, 199, 1),
                          ),
                          onPressed: () {
                            setState(() {
                              AllConversationsChats[
                                      AllPatientUsers[widget.patient_id]
                                          .ConversationChatID]
                                  .is_blocked = false;
                              AllConversationsChats[
                                      AllPatientUsers[widget.patient_id]
                                          .ConversationChatID]
                                  .show_patient_snack = true;
                            });

                            showTopSnackBar(
                              Overlay.of(context),
                              CustomSnackBar.success(
                                icon: Icon(Icons.done_outline_rounded,
                                    color: Color(0x15000000), size: 120),
                                message: "تم بدأ محادثة جديدة بنجاح",
                              ),
                            );
                          },
                          child: Text('ابدأ'),
                        ),
                      ],
                    ),
                  ),
                ),
              Flexible(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: AllConversationsChats[
                          AllPatientUsers[widget.patient_id].ConversationChatID]
                      .messages
                      .length,
                  reverse: true,
                  itemBuilder: (BuildContext context, int index) {
                    Message msg = AllConversationsChats[
                            AllPatientUsers[widget.patient_id]
                                .ConversationChatID]
                        .messages[index];
                    return ChatBubble(
                      message: msg.message_content,
                      username: msg.sender_role == "medical_staff"
                          ? "${AllStaffUsers[msg.sender_id].f_name} ${AllStaffUsers[msg.sender_id].l_name}"
                          : "${AllPatientUsers[widget.patient_id].f_name} ${AllPatientUsers[widget.patient_id].l_name}",
                      time: get_messag_date(msg.created_at),
                      type: "text",
                      replyText: "reply text",
                      isMe: msg.sender_role == "medical_staff" ? true : false,
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
            ],
          ),
        ),
      ),
    );
  }

  String get_messag_date(DateTime date) {
    return "${date.hour}:${date.minute}  ${date.month}/${date.day}";
  }
}
