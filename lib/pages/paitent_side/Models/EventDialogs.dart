import 'package:flutter/material.dart';

import 'package:my_tasks/models/users.dart';
import 'package:my_tasks/models/status_conversations.dart';

//تفاصيل الحدث في شاشة الطبيب والمريض(تنسيق النافذة التي تنبثق عند الضغط على الحدث)
class EventDetailsDialog extends StatelessWidget {
  final Event event;
  final int index;
  final Users patient;
  const EventDetailsDialog(
      {super.key,
      required this.event,
      required this.index,
      required this.patient});

  // final String userType; // قم بإضافة نوع المستخدم هنا

  // EventDetailsDialog(this.event, this.userType);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: AlertDialog(
          title: Text(
            event.title,
            textAlign: TextAlign.right,
            style: const TextStyle(color: Color.fromRGBO(29, 93, 155, 1)),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.description,
                textAlign: TextAlign.right,
                style: const TextStyle(color: Color.fromRGBO(29, 93, 155, 1)),
              ),
              const SizedBox(height: 10),
              if (event.image != null) Image.file(event.image!),
              const SizedBox(height: 30),
              Text(
                'التاريخ: ${event.timestamp.toString().substring(0, 10)}',
                textAlign: TextAlign.right,
                style: const TextStyle(color: Color.fromRGBO(114, 114, 114, 1)),
              ),
              const SizedBox(height: 5),
              Text(
                'الوقت: ${event.timestamp.toString().substring(10, 16)}',
                textAlign: TextAlign.right,
                style: const TextStyle(color: Color.fromRGBO(114, 114, 114, 1)),
              ),
            ],
          ),
          actions: [
           ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('إغلاق'),
            ),
          ],
        ),
      ),
    );
  }
}
