import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpPage extends StatelessWidget {
  final List<HelpQuestion> questions = [
    HelpQuestion(
      id: 0,
      question: 'كيف يمكنني إضافة مريض جديد؟',
      answer:
          'يمكنك الذهاب إلى الصفحة الرئيسية والنقر على زر الإضافة. بعد ذلك، قم بإدخال اسم المريض ورقم الغرفة واضغط على زر الإضافة الموجود في يمين الشريط العلوي في الواجهة الرئيسية.',
    ),
    HelpQuestion(
      id: 1,
      question: 'كيف يمكنني البحث عن مريض؟',
      answer:
          'يمكنك البحث عن مريض من خلال النقر على أيقونة البحث في الشريط العلوي وإدخال اسم المريض أو رقم الغرفة.',
    ),
    HelpQuestion(
      id: 2,
      question: 'كيف يمكنني عرض معلومات مريض معين؟',
      answer:
          'يمكنك النقر على اسم المريض في قائمة المرضى على الصفحة الرئيسية. ستظهر نافذة تحتوي على معلومات المريض ورقم الغرفة وخيارات أخرى.',
    ),
    HelpQuestion(
      id: 3,
      question: 'كيف يتم الحصول على معلومات تسجيل دخول أهل مريض؟',
      answer: 'من خلال نافذة معلومات المريض التي تظهر عند الضغط على اسمه.',
    ),
    HelpQuestion(
      id: 4,
      question: 'كيف يمكنني حذف مريض من قائمة المرضى؟',
      answer:
          'يمكنك النقر مطولاً على المريض. ستظهر نافذة تأكيد الحذف، بمجرد تأكيدك سيتم حذف المريض من القائمة.',
    ),
    HelpQuestion(
      id: 5,
      question: 'كيف يمكنني إرسال تحديث للحالة الصحية الخاصة بمريض ما؟',
      answer:
          'من خلال الضغط على اسم المريض في الواجهة الرئيسية، ومن ثم الضغظ على زر المتابعة الصحية، بعدها ستظهر نافذة جديدة بعنوان (المتابعة الصحية). قم بالضغط على زر إضافة الموجود في أسفل الواجهة لتظهر لك النافذة التي تستطيع من خلالها إرسال تحديث جديد.',
    ),
    HelpQuestion(
      id: 6,
      question: 'ما هي المعلومات التي يمكنني تضمينها في رسالة التحديث؟',
      answer:
          'يمكنك إضافة عنوان للتحديث (إجباري)، بالإضافة الى وجود حقل لكتابة تفاصيل أكثر عن الحالة الصحية (الوصف، إختياري). يمكنك أيضا إرفاق صورة مع رسالة التحديث الخاصة بالحالة الصحية.',
    ),
    HelpQuestion(
      id: 7,
      question: 'ميزة التحديثات المحفوطة',
      answer:
          'هي عبارة عن مجموعة من قوالب رسائل تحديثات الحالة الصحية التي تتميز بانها رسالة ذات طابع متكرر ومن المحتمل إرسالها أكثر من مرة في وقت قصير، بهدف توفير سهولة أعلى في استخدام التطبيق وتوفير الوقت على أفراد الكادر الطبي. فبمجرد اختيارك لإحدى الخيارات التي تظهر في نافذة (التحديثات المحفوطة) التي يمكنك الوصول اليها من خلال الضغط على الزر الموجود في يسار الشريط العلوي الخاص بنافذة المتابعة الصحية، ومن ثم كتابة قيمة معينة (حسب القالب المختار) ومن ثم إرسالها. يمكنك أيضا إنشاء قالب خاص وتخصيصه كما تريد، واستخدامه في أي وقت لاحق عن الحاجة لذلك.',
    ),
    HelpQuestion(
      id: 8,
      question: 'خاصية التحكم في المحادثة بين الطرفين (الدردشة)',
      answer:
          'في تطبيق اطمئن قمنا بتوفير محادثة يتم إجرائها بين أحد أفراد الكادر الطبي وأهل المريض، وذلك حسب الحاجة مثل سؤال أهل المريض عن شيء معين للكادر الطبي المسؤول عن المريض. تأتي المحادثة مع إمكانية التحكم الكامل من قبل الكادر الطبي المسؤول، وذلك من خلال إمكانية فتح وإغلاق المحادثة بهدف ضبط الرسائل المرسلة من قبل أهل المريض.',
    ),
    HelpQuestion(
      id: 9,
      question: 'فتح وإغلاق المحادثات من قبل الكادر الطبي',
      answer:
          'تتيح خاصية المحادثة لأهل المريض إرسال رسالة واحدة فقط ومن ثم يتم إغلاق المحادثة وانتظار أن يتم فتحها وبدء إجراء محادثة جديدة من قبل أحد أفراد الكادر الطبي. عندما يقوم أحد أفراد الكادر الطبي بفتح المحادثة يتم إتاحة المجال لأهل المريض بإرسال المزيد من الرسائل وإجراء محادثة مع الكادر الطبي. بمجرد انتهاء المحادثة بين الطرفين يجب على الطبيب او الممرض المسؤول إغلاق المحادثة لإغلاقها من جهة أهل المريض. ',
    ),
    HelpQuestion(
      id: 10,
      question: 'من أين يمكنني التحكم في المحادثة؟',
      answer:
          'من خلال الضغط على الزر الموجود في يسار الشريط العلوي الخاص بالمحادثة، ستظهر قائمة منسدلة تحتوي على خيارات فتح وإغلاق المحادثة، للتحكم في المحادثات التي تجري بين الكادر الطبي وأهل المريض.',
    ),
    HelpQuestion(
      id: 11,
      question: 'كيف يمكنني حذف جميع المرضى؟',
      answer:
          'يمكنك القيام بذلك عن طريق الانتقال إلى صفحة الإعدادات، بعد ذلك انقر على زر "حذف جميع المرضى". ستظهر نافذة تأكيد الحذف، انقر على زر "تأكيد" لحذف جميع المرضى من القائمة.',
    ),
  ];

  HelpPage({super.key});

  Icon getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icon(
          Icons.add_circle,
          color: Color.fromRGBO(29, 93, 155, 1),
        );
      case 1:
        return Icon(Icons.search, color: Color.fromRGBO(29, 93, 155, 1));
      case 2:
        return Icon(Icons.diversity_1_sharp,
            color: Color.fromRGBO(29, 93, 155, 1));
      case 3:
        return Icon(Icons.login_rounded, color: Color.fromRGBO(29, 93, 155, 1));
      case 4:
        return Icon(Icons.delete, color: Color.fromRGBO(29, 93, 155, 1));
      case 5:
        return Icon(Icons.send, color: Color.fromRGBO(29, 93, 155, 1));
      case 6:
        return Icon(Icons.message, color: Color.fromRGBO(29, 93, 155, 1));
      case 7:
        return Icon(Icons.save_outlined, color: Color.fromRGBO(29, 93, 155, 1));
      case 8:
        return Icon(Icons.chat_bubble_outline,
            color: Color.fromRGBO(29, 93, 155, 1));
      case 9:
        return Icon(Icons.lock_clock_outlined,
            color: Color.fromRGBO(29, 93, 155, 1));
      case 10:
        return Icon(Icons.view_list, color: Color.fromRGBO(29, 93, 155, 1));
      case 11:
        return Icon(Icons.delete_forever,
            color: Color.fromRGBO(29, 93, 155, 1));
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
