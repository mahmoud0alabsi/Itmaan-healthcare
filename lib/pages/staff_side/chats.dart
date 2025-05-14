// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'widgets/chat_item.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:my_tasks/models/conversations.dart';
import 'package:my_tasks/models/users.dart';


class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {

  bool check_if_empty() {
    bool all_removed = true;
    for (Users user in AllPatientUsers) {
      if (user.isRemoved == false) {
        all_removed = false;
        return false;
      }
    }

    if (AllPatientUsers.isEmpty || all_removed == true) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(
            Icons.search,
            color: Color.fromRGBO(29, 93, 155, 1),
          ),
          onPressed: () {
            showSearch(
              context: context,
              delegate: PatientSearchDelegate(),
            );
          },
        ),
        title: Center(
            child: Text("المحادثات",
                style: GoogleFonts.arefRuqaa(
                    color: const Color.fromRGBO(29, 93, 155, 1),
                    fontSize: 30))),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.archive,
              color: Color.fromRGBO(29, 93, 155, 0),
            ),
          )
        ],
      ),

      body: PageView(
        children: <Widget>[
          check_if_empty()
              ? Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    size: 100.0,
                                    Icons.chat_rounded,
                                    color: Color.fromRGBO(29, 93, 155, 1),
                                  )
                                ]),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      'لا يوجد ملفات مرضى مخزنة، قم بإضافة مريض جديد',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color:
                                              Color.fromRGBO(29, 93, 155, 1)),
                                    ),
                                  ),
                                ]),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'من خلال الواجهة الرئيسية',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Color.fromRGBO(29, 93, 155, 1)),
                                  ),
                                ]),
                          ]),
                    ),
                  ],
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(10),
                  separatorBuilder: (BuildContext context, int index) {
                    return Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        height: 0.5,
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: const Divider(),
                      ),
                    );
                  },
                  itemCount: AllConversationsChats.length,
                  itemBuilder: (BuildContext context, int index) {
                    ConversationsChats chat = AllConversationsChats[index];

                    if (AllPatientUsers[chat.patient_id].isRemoved) {
                      return const SizedBox.shrink();
                    } else {
                      return ChatItem(
                        dp: "assets/images/cm0.jpeg",
                        name:
                            "${AllPatientUsers[chat.patient_id].f_name} ${AllPatientUsers[chat.patient_id].l_name}",
                        isOnline: true,
                        counter: chat.unread_msgs,
                        msg: get_last_message(chat.messages),
                        time: get_last_messag_date(chat.messages),
                        patient_id: chat.patient_id,
                      );
                    }
                  },
                ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      //   onPressed: () {},
      // ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

String get_last_message(List<Message> messages) {
  if (messages.isNotEmpty) {
    return messages.first.message_content;
  } else {
    return "";
  }
}

String get_last_messag_date(List<Message> messages) {
  if (messages.isNotEmpty) {
    return "${messages.last.created_at.hour}:${messages.last.created_at.minute}  ${messages.last.created_at.month}/${messages.last.created_at.day}";
  } else {
    return "";
  }
}

class PatientSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<ConversationsChats> results = AllConversationsChats.where((chat) {
      return AllPatientUsers[chat.patient_id]
              .f_name!
              .toLowerCase()
              .contains(query.toLowerCase()) ||
          AllPatientUsers[chat.patient_id]
              .l_name!
              .toLowerCase()
              .contains(query.toLowerCase()) ||
          AllPatientUsers[chat.patient_id].department!.contains(query);
    }).toList();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.builder(
        itemCount: results.length,
        itemBuilder: (BuildContext context, int index) {
          ConversationsChats chat = results[index];

          if (AllPatientUsers[chat.patient_id].isRemoved) {
            return const SizedBox.shrink();
          } else {
            return ChatItem(
              dp: "assets/images/cm0.jpeg",
              name:
                  "${AllPatientUsers[chat.patient_id].f_name} ${AllPatientUsers[chat.patient_id].l_name}",
              isOnline: true,
              counter: 1,
              msg: get_last_message(chat.messages),
              time: get_last_messag_date(chat.messages),
              patient_id: chat.patient_id,
            );
          }
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF75C2F6),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Icon(
              Icons.search,
              size: 64,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'ابحث عن المرضى من خلال الاسم أو رقم الغرفة.',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF1D5D9B),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
