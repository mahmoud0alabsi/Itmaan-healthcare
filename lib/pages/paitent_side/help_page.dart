import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpQuestion {
  final int id;
  final String question;
  final String answer;

  HelpQuestion({
    required this.id,
    required this.question,
    required this.answer,
  });
}


class HelpPage extends StatelessWidget {
  final List<HelpQuestion> questions = [
    HelpQuestion(
      id: 0,
      question: 'تحديثات الحالة الصحية الخاصة بالمريض',
      answer:
          'يمكنك الإطلاع على آخر تحديثات الحالة الصحية الخاصة بالمريض من خلال الواجهة الرئيسية (واجهة التحديثات الصحية) في التطبيق. تظهر التحديثات على شكل خط تتابع زمني، وعند كل تحديث يمكنك الاطلاع على الوقت والتاريخ الذي تم إضافة التحديث فيه، بالإضافة الى عنوان التحديث.',
    ),
    HelpQuestion(
      id: 1,
      question: 'كيف يمكنني الإطلاع على تفاصيل التحديث الصحي؟',
      answer:
          'من خلال الضغظ على أحد التحديثات الصحية التي تظهر في الواجهة الرئيسية، تظهر نافذة جديدة تحتوي على جميع المعلومات والتفاصيل الخاصة بالتحديث الصحي، مثل العنوان والوصف والوقت والتاريخ الخاص بالتحديث، بالإضافة الى صورة في حال تم إرفاقها من قبل الكادر الطبي المسؤول.',
    ),
    HelpQuestion(
      id: 2,
      question: 'كيف يمكنني إجراء محادثة مباشرة مع الكادر الطبي المسؤول عن المريض؟',
      answer:
          'يمكنك إجراء محادثة مباشرة مع أحد أفراد الكادر الطبي المتاحين من خلال التوجه الى واجهة المحادثة. يمكنك إرسال رسالة واحدة فقط في البداية، بعدها عليك انتظار موافقة إجراء محادثة من قبل أحد أفراد الطاقم الطبي المسؤول، بعدها يمكنك إرسال المزيد من الرسائل.',
    ),
    HelpQuestion(
      id: 3,
      question: 'كيف يمكنني الوصول الى المعلومات الخاصة بالمريض؟',
      answer: 'من خلال التوجه الى واجهة الإعدادات، تظهر لك المعلومات الخاصة بالمريض والمدخلة من قبل الكادر الطبي المسؤول.',
    ),
  ];

  HelpPage({super.key});

    Icon getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icon(
          Icons.update,
          color: Color.fromRGBO(29, 93, 155, 1),
        );
      case 1:
        return Icon(Icons.info, color: Color.fromRGBO(29, 93, 155, 1));
      case 2:
        return Icon(Icons.chat_outlined,
            color: Color.fromRGBO(29, 93, 155, 1));
      case 3:
        return Icon(Icons.account_circle, color: Color.fromRGBO(29, 93, 155, 1));
      default:
        return Icon(Icons.error); // Handle all other integer values
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: const Icon(Icons.search, color: Colors.white),
        title: Center(
            child: Text("المساعدة",
                style: GoogleFonts.arefRuqaa(
                    color: const Color.fromRGBO(29, 93, 155, 1),
                    fontSize: 30))),
        actions: const [
          Icon(
            Icons.report,
            color: Color.fromARGB(0, 255, 255, 255),
          ),
          Icon(
            Icons.report,
            color: Color.fromARGB(0, 255, 255, 255),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          int id = questions[index].id;

          return ExpansionTile(
            title: Text(
              questions[index].question,
              textAlign: TextAlign.right,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            leading:
                const Icon(Icons.circle, color: Color.fromRGBO(29, 93, 155, 1)),
            children: [

              getIconForIndex(id),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  questions[index].answer,
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
