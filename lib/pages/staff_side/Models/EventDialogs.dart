import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:google_fonts/google_fonts.dart';

import 'Providers.dart';

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

  void _deleteEvent(BuildContext context) {
    // يمكنك هنا قم بإضافة الكود الخاص بحذف الحدث من قائمة الأحداث أو من أي مصدر آخر.
    // ثم قم بإغلاق الديالوج.
    Provider.of<RecordTimelineProvider>(context, listen: false)
        .deleteEvent(index, patient);
    Navigator.pop(context);
  }

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
              const SizedBox(height: 5),
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
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
              onPressed: () {
                _deleteEvent(context); // استدعاء الدالة لحذف الحدث
              ScaffoldMessenger.of(context)
                .showSnackBar(
                  SnackBar(
                    backgroundColor: const Color.fromARGB(255, 155, 167, 44),
                    content: Text(
                      'تم الحذف بنجاح',
                      style: GoogleFonts.ibmPlexSansArabic(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
              child: const Text('حذف'),
            ),
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

//تفاصيل الحدث في شاشة السجل الطبي (تنسيق النافذة التي تنبثق عند الضغط على الحدث)
class RecordEventDetailsDialog extends StatelessWidget {
  final Event event;
  final int index;
  final Users patient;
  const RecordEventDetailsDialog(
      {super.key,
      required this.event,
      required this.index,
      required this.patient});

  void _deleteEvent(BuildContext context) {
    // يمكنك هنا قم بإضافة الكود الخاص بحذف الحدث من قائمة الأحداث أو من أي مصدر آخر.
    // ثم قم بإغلاق الديالوج.
    Provider.of<RecordTimelineProvider>(context, listen: false)
        .deleteRecordEvent(index, patient);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
          title: Text(
            event.title,
            textAlign: TextAlign.right,
            style: const TextStyle(color: Color.fromRGBO(29, 93, 155, 1)),
          ),
          content: Directionality(
            textDirection: TextDirection.ltr,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  event.description,
                  textAlign: TextAlign.right,
                  style: const TextStyle(color: Color.fromRGBO(29, 93, 155, 1)),
                ),
                const SizedBox(height: 5),
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
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                 _deleteEvent(context); // استدعاء الدالة لحذف الحدث
                ScaffoldMessenger.of(context)
                .showSnackBar(
                  SnackBar(
                    backgroundColor: const Color.fromARGB(255, 155, 167, 44),
                    content: Text(
                      'تم الحذف بنجاح',
                      style: GoogleFonts.ibmPlexSansArabic(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
              child: const Text('حذف'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('إغلاق'),
            ),
          ],
        ),
    );
  }
}
