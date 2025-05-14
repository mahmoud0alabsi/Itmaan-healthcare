// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import  'package:intl/intl.dart';
// import 'Models/Event.dart';
// import 'Models/EventDialogs.dart';
// import 'Models/Providers.dart';
// import 'Models/AddEvent.dart';
// import 'Models/Record.dart';
// import 'Models/PredefinedEvent.dart';

// //تنسيق شاشة المريض والطبيب والتي تحتوي على تنسيق الشريط العلوي وتنسيق الأزرار وعرض الأحداث وعرض الأزرار حسب المستخدم
// class TimelineScreen extends StatelessWidget {
//   final String userType;

//   TimelineScreen(this.userType);

//   @override
//   Widget build(BuildContext context) {
//     final timelineProvider = Provider.of<TimelineProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('شريط التحديثات'),
//         actions: [
//             // IconButton(
//             //   icon: Icon(Icons.list_outlined), // يمكنك تغيير الأيقونة حسب تفضيلك
//             //   onPressed: () {
//             //     Navigator.push(
//             //       context,
//             //       MaterialPageRoute(builder: (context) => RecordScreen()), // الانتقال إلى شاشة السجل الطبي
//             //     );
//             //   },
//             // ),
      
//             IconButton(
//               icon: Icon(Icons.event), // الأيقونة التي تريدها
//               onPressed: () {
//                 showPredefinedEventsDialog(context); // عند الضغط على الأيقونة، اعرض الـ AlertDialog
//               },
//             ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: CustomPaint(
//               // painter: TimelinePainter(timelineProvider.events),
//               child: ListView.builder(
//                 itemCount: timelineProvider.events.length,
//                 itemBuilder: (context, index) {
//                   final event = timelineProvider.events[index];
//                   return InkWell(
//                     onTap: () {
//                       showDialog(
//                         context: context,
//                         builder: (context) => EventDetailsDialog(event, userType), // قم بتمرير نوع المستخدم هنا
//                       );
//                     },
//                     child: EventCard(
//                       title: event.title,
//                       description: event.description,
//                       icon: event.icon,
//                       eventTimeFormatted: DateFormat('h:mm\n  a').format(DateTime.parse(event.timestamp)),
//                       eventDateFormatted: DateFormat('dd/MM/yyyy').format(DateTime.parse(event.timestamp)),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: Align(
//         alignment: Alignment.bottomCenter,
//         child: FloatingActionButton(
//           onPressed: () {
//             showDialog(
//               context: context,
//               builder: (context) => AddEventDialog(),
//             );
//           },
//           child: Icon(Icons.add),
//         ),
//       )
//     );
//   }
// }

