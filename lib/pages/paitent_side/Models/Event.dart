import 'package:flutter/material.dart';

//المتغيرات المتعلقة بالحدث
//الإسم والعنوان والتوقيت والصورة
// class Event {
//   final String title;
//   final String description;
//   final String timestamp;
//   final File? image;
//   final IconData? icon;

//   Event({required this.title, required this.description, required this.timestamp, this.image, this.icon});
// }

//شكل الحدث الذي يعرض في شاشة الطبيب والمريض والسجل الطبي (شكل موحّد)
//الدائرة التي في داخلها التوقيت والخط الواصل بين التحديثات وتنسيق العنوان والتاريخ
class EventCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData? icon;
  final String? eventTimeFormatted; // وسيطة لعرض الوقت المنسق بتنسيق 12 ساعة
  final String? eventDateFormatted; // وسيطة لعرض التاريخ
  late final bool is_first;
  late final bool is_last;

  EventCard({
    super.key,
    required this.title,
    required this.description,
    this.icon,
    this.eventTimeFormatted, // تمرير الوقت المنسق كمعامل اختياري
    this.eventDateFormatted, // تمرير التاريخ كمعامل اختياري
    required this.is_first,
    required this.is_last,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0), // تعديل هامش العلوي
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Column(
            children: [
              if (is_first)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: const Color.fromRGBO(29, 93, 155, 1), width: 7),
                    shape: BoxShape.circle,
                  ),
                  margin: const EdgeInsets.only(right: 7, left: 7, top: 5),
                ),
              Container(
                color: const Color.fromRGBO(29, 93, 155, 1),
                width: 2,
                height: 30,
                margin: const EdgeInsets.symmetric(horizontal: 10),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: const Color.fromRGBO(29, 93, 155, 1), width: 2),
                  shape: BoxShape.circle,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 7),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Icon(Icons.circle, color: Colors.white, size: 50),
                    Text(
                      eventTimeFormatted ?? '', // استخدام الوقت المنسق هنا
                      style: const TextStyle(
                          color: Color.fromRGBO(29, 93, 155, 1), fontSize: 10),
                    ),
                  ],
                ),
              ),
              Container(
                color: const Color.fromRGBO(29, 93, 155, 1),
                width: 2,
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 10),
              ),
              if (is_last)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: const Color.fromRGBO(29, 93, 155, 1), width: 7),
                    shape: BoxShape.circle,
                  ),
                  // margin: const EdgeInsets.only(right: 7, left: 7, top: 5),
                ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (icon != null) Icon(icon, color: Colors.white, size: 30),
              const SizedBox(height: 20),
              //Text('\n', style: TextStyle(color: Colors.blue, fontSize: 10)),
              //SizedBox(height: 1),
              //Text('\n\n', style: TextStyle(color: Colors.blue, fontSize: 10)),
              //SizedBox(height: 1),
              Container(
                child: Text(
                  title.length > 30 ? '${title.substring(0, 30)}.....' : title,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              Text(
                eventDateFormatted ?? '', // استخدام التاريخ المنسق هنا
                style: const TextStyle(
                    color: Color.fromARGB(255, 0, 91, 76), fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
