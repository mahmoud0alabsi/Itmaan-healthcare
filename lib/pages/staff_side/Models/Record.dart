// import 'package:flutter/material.dart';
// import 'package:my_tasks/models/status_conversations.dart';
// import 'package:provider/provider.dart';
// import 'package:intl/intl.dart';
// import 'dart:ui' as ui;

// import '../Models/Event.dart';
// import '../Models/EventDialogs.dart';
// import '../Models/Providers.dart';
// import 'AddEventRecord.dart';
// import 'PredefinedEvent.dart';

// import 'package:my_tasks/models/users.dart';

// //تنسيق شاشة السجل الطبي وطريقة عرض الأحداث التي فيها
// class RecordScreen extends StatelessWidget {
//   final Users patient;
//   const RecordScreen({super.key, required this.patient});

//   @override
//   Widget build(BuildContext context) {
//     final recordProvider = Provider.of<RecordTimelineProvider>(context);

  
//     return Directionality(
//       textDirection: ui.TextDirection.rtl,
//       child: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//               icon: const Icon(Icons.arrow_back_ios_rounded),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           title: const Text('السجل الطبي'),
//           actions: [
//             IconButton(
//               icon: const Icon(
//                   Icons.mode_comment_outlined), // الأيقونة التي تريدها
//               onPressed: () {
//                 showPredefinedEventsDialog(context,
//                     patient, 'record_screen'); // عند الضغط على الأيقونة، اعرض الـ AlertDialog
//               },
//             ),
//           ],
//         ),
//         body: Column(
//           children: [
//             Expanded(
//               child: CustomPaint(
//                   child: ListView.builder(
//                 itemCount: AllMedicalRecords[patient.MedicalRecordID]
//                     .status_messages
//                     .length,
//                 itemBuilder: (context, index) {
//                   final event = AllMedicalRecords[patient.MedicalRecordID]
//                       .status_messages[index];

//                   if (event.isRemoved) {
//                     return const SizedBox.shrink();
//                   } else {
//                     return InkWell(
//                       onTap: () {
//                         showDialog(
//                           context: context,
//                           builder: (context) => RecordEventDetailsDialog(
//                               event: event, index: index, patient: patient),
//                         );
//                       },
//                       child: EventCard(
//                         title: event.title,
//                         description: event.description,
//                         eventTimeFormatted: DateFormat('h:mm\n  a')
//                             .format(DateTime.parse(event.timestamp)),
//                         eventDateFormatted: DateFormat('dd/MM/yyyy')
//                             .format(DateTime.parse(event.timestamp)),
//                       ),
//                     );
//                   }
//                 },
//               )),
//             ),
//           ],
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
//         floatingActionButton: FloatingActionButton(
             
//             onPressed: () {
//               showDialog(
//                 context: context,
//                 builder: (context) => AddEventDialogRecord(
//                   patient: patient,
//                 ),
//               );
//             },
//             child: const Icon(Icons.add), // يمكنك تغيير الأيقونة حسب تفضيلك
//           ),
//       ),
//     );  
//   }
// }
