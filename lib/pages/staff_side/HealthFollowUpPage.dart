import 'package:flutter/material.dart';
import 'package:my_tasks/models/conversations.dart';
import 'package:my_tasks/models/status_conversations.dart';
// import 'package:get/get.dart';
import 'package:my_tasks/models/users.dart';
import 'dart:ui' as ui;

import 'package:intl/intl.dart';
import 'Models/Event.dart';
import 'Models/AddEvent.dart';
// import 'Models/Record.dart';
import 'Models/PredefinedEvent.dart';
import 'Models/EventDialogs.dart';
import 'Models/Providers.dart';

import 'package:provider/provider.dart';

// class HealthFollowUpPage extends StatefulWidget {
//   final Users patient;
//   const HealthFollowUpPage({super.key, required this.patient});

//   @override
//   State<HealthFollowUpPage> createState() => _HealthFollowUpPageState(patient);
// }

// class _HealthFollowUpPageState extends State<HealthFollowUpPage> {
//   Users patient;
//   _HealthFollowUpPageState(this.patient);

//   @override
//   Widget build(BuildContext context) {
//     final timelineProvider = Provider.of<TimelineProvider>(context);

//     return Directionality(
//       textDirection: ui.TextDirection.rtl,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color.fromRGBO(29, 93, 155, 1),
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back_ios_rounded),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           title: Text("المتابعة الصحية"),
//           actions: [
//             IconButton(
//               icon: const Icon(Icons.history), // الأيقونة التي تريدها
//               onPressed: () {
//                 Get.to(
//                     () => RecordScreen(
//                           patient: patient,
//                         ),
//                     transition: Transition.upToDown,
//                     duration: const Duration(milliseconds: 400));

//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(
//                 //       builder: (context) => RecordScreen(
//                 //             patient: patient,
//                 //           )), // الانتقال إلى شاشة السجل الطبي
//                 // );
//               },
//             ),
//             IconButton(
//               icon: const Icon(
//                   Icons.mode_comment_outlined), // الأيقونة التي تريدها
//               onPressed: () {
//                 showPredefinedEventsDialog(context,
//                     patient); // عند الضغط على الأيقونة، اعرض الـ AlertDialog
//               },
//             ),
//           ],
//         ),
//         body: Column(
//           children: [
//             Expanded(
//               child: CustomPaint(
//                 // painter: TimelinePainter(timelineProvider.events),
//                 child: ListView.builder(
//                   itemCount:
//                       AllStatusConversations[patient.StatusConversationID]
//                           .status_messages
//                           .length, //timelineProvider.events.length,
//                   itemBuilder: (context, index) {
//                     final event =
//                         AllStatusConversations[patient.StatusConversationID]
//                             .status_messages[index];

//                     if (event.isRemoved) {
//                       return const SizedBox.shrink();
//                     } else {
//                       return InkWell(
//                         onTap: () {
//                           showDialog(
//                             context: context,
//                             builder: (context) => EventDetailsDialog(
//                                 event: event,
//                                 index: index,
//                                 patient: patient), // قم بتمرير نوع المستخدم هنا
//                           );
//                         },
//                         child: EventCard(
//                           title: event.title,
//                           description: event.description,
//                           icon: event.icon,
//                           eventTimeFormatted: DateFormat('h:mm\n  a')
//                               .format(DateTime.parse(event.timestamp)),
//                           eventDateFormatted: DateFormat('dd/MM/yyyy')
//                               .format(DateTime.parse(event.timestamp)),
//                         ),
//                       );
//                     }
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             showDialog(
//               context: context,
//               builder: (context) => AddEventDialog(patient: patient),
//             );
//           },
//           child: const Icon(Icons.add),
//         ),
//         floatingActionButtonLocation:
//             FloatingActionButtonLocation.miniCenterFloat,
//       ),
//     );
//   }
// }

//تنسيق شاشة السجل الطبي وطريقة عرض الأحداث التي فيها
class HealthFollowUpPage extends StatelessWidget {
  final Users patient;
  const HealthFollowUpPage({super.key, required this.patient});

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
    final recordProvider = Provider.of<RecordTimelineProvider>(context);

    final ScrollController _controller = ScrollController();

    // Scroll to the end of the list initially
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        _controller.jumpTo(_controller.position.maxScrollExtent);
      } catch (e) {}
    });

    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(29, 93, 155, 1),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("المتابعة الصحية"),
          actions: [
            // IconButton(
            //   icon: const Icon(Icons.history), // الأيقونة التي تريدها
            //   onPressed: () {
            //     Get.to(
            //         () => RecordScreen(
            //               patient: patient,
            //             ),
            //         transition: Transition.upToDown,
            //         duration: const Duration(milliseconds: 400));

            //     // Navigator.push(
            //     //   context,
            //     //   MaterialPageRoute(
            //     //       builder: (context) => RecordScreen(
            //     //             patient: patient,
            //     //           )), // الانتقال إلى شاشة السجل الطبي
            //     // );
            //   },
            // ),

            IconButton(
              icon: const Icon(
                  Icons.mode_comment_outlined), // الأيقونة التي تريدها
              onPressed: () {
                showPredefinedEventsDialog(context, patient,
                    'health_screen'); // عند الضغط على الأيقونة، اعرض الـ AlertDialog
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: CustomPaint(
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
                                              'لا يوجد تحديثات سابقة للعرض، قم باضافة تحديث جديد',
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
                          controller: _controller,
                          // reverse: true,
                          itemCount: AllStatusConversations[
                                  patient.StatusConversationID]
                              .status_messages
                              .length,
                          itemBuilder: (context, index) {
                            final event = AllStatusConversations[
                                    patient.StatusConversationID]
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
                        )),
            ),
          ],
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AddEventDialog(patient: patient),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
