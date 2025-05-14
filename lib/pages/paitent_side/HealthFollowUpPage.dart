import 'package:flutter/material.dart';
import 'package:my_tasks/models/status_conversations.dart';
// import 'package:my_tasks/pages/abd/patient.dart';
import 'package:my_tasks/models/users.dart';
import 'dart:ui' as ui;

import 'package:intl/intl.dart';
import 'Models/Event.dart';
import 'Models/EventDialogs.dart';

class HealthFollowUpPage extends StatefulWidget {
  final Users patient;
  const HealthFollowUpPage({super.key, required this.patient});

  @override
  State<HealthFollowUpPage> createState() => _HealthFollowUpPageState(patient);
}

class _HealthFollowUpPageState extends State<HealthFollowUpPage> {
  Users patient;
  _HealthFollowUpPageState(this.patient);

    bool check_if_empty() {
    bool all_removed = true;

    for (Event event in AllStatusConversations[patient.StatusConversationID]
        .status_messages) {
      if (event.isRemoved == false) {
        all_removed = false;
        return false;
      }
    }

    if (AllStatusConversations[patient.StatusConversationID]
            .status_messages
            .isEmpty ||
        all_removed == true) {
      return true;
    }

    return false;
  }

  bool is_new_day(int index) {
    List<Event> all_msgs =
        AllStatusConversations[patient.StatusConversationID].status_messages;
    if (index == 0) {
      return false;
    }
    if (all_msgs[index].timestamp.toString().substring(8, 10) !=
        all_msgs[index - 1].timestamp.toString().substring(8, 10)) {
      return true;
    } else {
      return false;
    }
  }

  bool is_last_msg(int index) {
    List<Event> all_msgs =
        AllStatusConversations[patient.StatusConversationID].status_messages;
    if (index == all_msgs.length - 1) {
      return true;
    }
    if (all_msgs[index].timestamp.toString().substring(8, 10) !=
        all_msgs[index + 1].timestamp.toString().substring(8, 10)) {
      return true;
    } else {
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    // final timelineProvider = Provider.of<TimelineProvider>(context);

    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(29, 93, 155, 1),
          title: const Text("المتابعة الصحية"),
        ),
        body: Column(
          children: [
            Expanded(
              child: CustomPaint(
                // painter: TimelinePainter(timelineProvider.events),
                child: check_if_empty()
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 00.0),
                              child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            size: 100.0,
                                            Icons.messenger_outline_rounded,
                                            color:
                                                Color.fromRGBO(29, 93, 155, 1),
                                          )
                                        ]),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FittedBox(
                                            fit: BoxFit.contain,
                                            child: Text(
                                              'لا يوجد رسائل سابقة للعرض، قم بإضافة رسالة جديدة',
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Color.fromRGBO(
                                                      29, 93, 155, 1)),
                                            ),
                                          ),
                                        ]),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'من خلال زر الإضافة السفلي',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Color.fromRGBO(
                                                    29, 93, 155, 1)),
                                          ),
                                        ]),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            size: 50.0,
                                            Icons.arrow_downward_rounded,
                                            color: Color.fromARGB(
                                                255, 48, 135, 221),
                                          )
                                        ]),
                                  ]),
                            ),
                          ],
                        )
                      : ListView.builder(
                  itemCount:
                      AllStatusConversations[patient.StatusConversationID]
                          .status_messages
                          .length, //timelineProvider.events.length,
                  itemBuilder: (context, index) {
                    final event =
                        AllStatusConversations[patient.StatusConversationID]
                            .status_messages[index];

                    if (event.isRemoved) {
                      return const SizedBox.shrink();
                    } else {
                              if (is_new_day(index)) {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Divider(
                                          color: Color.fromARGB(255, 0, 91, 76),
                                        )),
                                        Text(
                                          '  ${event.timestamp.toString().substring(0, 10)}  ',
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 0, 91, 76),
                                          ),
                                        ),
                                        Expanded(
                                            child: Divider(
                                          color: Color.fromARGB(255, 0, 91, 76),
                                        )),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) =>
                                              EventDetailsDialog(
                                                  event: event,
                                                  index: index,
                                                  patient: patient),
                                        );
                                      },
                                      child: EventCard(
                                        title: event.title,
                                        description: event.description,
                                        eventTimeFormatted:
                                            DateFormat('h:mm\n  a').format(
                                                DateTime.parse(
                                                    event.timestamp)),
                                        eventDateFormatted:
                                            DateFormat('dd/MM/yyyy').format(
                                                DateTime.parse(
                                                    event.timestamp)),
                                        is_first: true,
                                        is_last: false,
                                      ),
                                    )
                                  ],
                                );
                              } else {
                                return InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => EventDetailsDialog(
                                          event: event,
                                          index: index,
                                          patient: patient),
                                    );
                                  },
                                  child: EventCard(
                                    title: event.title,
                                    description: event.description,
                                    eventTimeFormatted: DateFormat('h:mm\n  a')
                                        .format(
                                            DateTime.parse(event.timestamp)),
                                    eventDateFormatted: DateFormat('dd/MM/yyyy')
                                        .format(
                                            DateTime.parse(event.timestamp)),
                                    is_first: index == 0 ? true : false,
                                    is_last: is_last_msg(index) ? true : false,
                                  ),
                                );
                              }
                            }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
