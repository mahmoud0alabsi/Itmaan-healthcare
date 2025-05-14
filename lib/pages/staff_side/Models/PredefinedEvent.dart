import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'Providers.dart';

import 'package:my_tasks/models/users.dart';
import 'package:my_tasks/models/status_conversations.dart';
import 'package:my_tasks/models/DB_Manegers/predefined_events_maneger.dart';
// import 'package:flutter_iconpicker/flutter_iconpicker.dart';

import 'package:google_fonts/google_fonts.dart';

class PreEvents {
  late String title;
  late String pre_text;
  late String post_text;

  PreEvents(
      {required this.title, required this.pre_text, required this.post_text});

  PreEvents.fromJsonConstructer(
      String title, String pre_text, String post_text) {
    this.title = title;
    this.pre_text = pre_text;
    this.post_text = post_text;
  }

  // Convert StatusConversations object to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'pre_text': pre_text,
      'post_text': post_text,
    };
  }

  // Create a StatusConversations object from JSON
  factory PreEvents.fromJson(Map<String, dynamic> json) {
    return PreEvents.fromJsonConstructer(
      json['title'],
      json['pre_text'],
      json['post_text'],
    );
  }
}

List<PreEvents> All_predefind_events = [
  PreEvents.fromJsonConstructer('ضغط الدم', 'ضغط الدم هو', ''),
  PreEvents.fromJsonConstructer('مستوى السكر', 'مستوى السكر هو', ''),
  PreEvents.fromJsonConstructer('الحرارة', 'حرارة المريض الآن هي', ''),
];

//قائمة الأحدث الجاهزة وتنسيقها
//من هنا يمكن إضافة أحداث جاهزة إضافية حسب الحاجة
void showPredefinedEventsDialog(
    BuildContext context, Users patient, String from_where) {
  // List<Widget> All_pre_event = [
  //   _buildPredefinedEvent(
  //       context, 'ضغط الدم', 'ضغط الدم هو', '', patient, from_where),
  //   _buildPredefinedEvent(
  //       context, 'مستوى السكر', 'مستوى السكر هو', '', patient, from_where),
  //   _buildPredefinedEvent(
  //       context, 'الحرارة', 'حرارة المريض الآن هي', '', patient, from_where),
  // ];

  showDialog(
    context: context,
    builder: (context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 10,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 48, 135, 221),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'التحديثات المحفوظة',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Container(
                          height: 250, // Change as per your requirement
                          // width: MediaQuery.of(context).size.width,

                          child: ListView.builder(
                              itemCount: All_predefind_events.length,
                              itemBuilder: (BuildContext context, int index) {
                                return _buildPredefinedEvent(
                                    context,
                                    All_predefind_events[index].title,
                                    All_predefind_events[index].pre_text,
                                    All_predefind_events[index].post_text,
                                    patient,
                                    from_where);
                                // return const SizedBox.shrink();
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                        255, 106, 222, 49)),
                                onPressed: () {
                                  final TextEditingController BeforeController =
                                      TextEditingController(text: '');
                                  final TextEditingController AfterController =
                                      TextEditingController(text: '');
                                  final TextEditingController TitleController =
                                      TextEditingController(text: '');

                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Dialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            elevation: 10,
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: Colors.white,
                                              ),
                                              child: SingleChildScrollView(
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        'إنشاء قالب تحديثات جديد',
                                                        style: const TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    48,
                                                                    135,
                                                                    221)),
                                                      ),
                                                      const SizedBox(
                                                          height: 12),
                                                      TextField(
                                                        controller:
                                                            TitleController, // استخدم وحدة تحكم الوصف هنا
                                                        decoration: InputDecoration(
                                                            labelText:
                                                                "عنوان التحديث"),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      TextField(
                                                        controller:
                                                            BeforeController, // استخدم وحدة تحكم الوصف هنا
                                                        decoration: InputDecoration(
                                                            labelText:
                                                                "النص الذي يسبق القيمة المتغيرة"),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      TextField(
                                                        controller:
                                                            AfterController, // استخدم وحدة تحكم الوصف هنا
                                                        decoration: InputDecoration(
                                                            labelText:
                                                                "النص الذي يتبع القيمة المتغيرة"),
                                                      ),
                                                      const SizedBox(
                                                          height: 18),

                                                      // ElevatedButton(
                                                      //   onPressed: _pickIcon,
                                                      //   child: const Text(
                                                      //       'Open IconPicker'),
                                                      // ),

                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          ElevatedButton(
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              backgroundColor:
                                                                  Colors.red,
                                                            ),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Icon(
                                                                Icons.cancel),
                                                          ),
                                                          const SizedBox(
                                                              width: 10),
                                                          ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                                backgroundColor:
                                                                    const Color
                                                                            .fromARGB(
                                                                        255,
                                                                        106,
                                                                        222,
                                                                        49)),
                                                            onPressed: () {
                                                              
                                                              if (TitleController
                                                                  .text
                                                                  .isNotEmpty) {

                                                                    PreEvents x = PreEvents
                                                                  .fromJsonConstructer(
                                                                      TitleController
                                                                          .text,
                                                                      BeforeController
                                                                          .text,
                                                                      AfterController
                                                                          .text);

                                                                PreEventsManager
                                                                    .addPreEvents(
                                                                        x);

                                                                        Navigator.pop(
                                                                  context);
                                                                  
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .red,
                                                                    content:
                                                                        Text(
                                                                      'الرجاء إدخال عنوان صحيح.',
                                                                      style: GoogleFonts
                                                                          .ibmPlexSansArabic(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            16,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }

                                                              // All_predefind_events
                                                              //     .add([
                                                              //   TitleController
                                                              //       .text,
                                                              //   BeforeController
                                                              //       .text,
                                                              //   AfterController
                                                              //       .text
                                                              // ]);
                                                              // All_pre_event.add(
                                                              //     _buildPredefinedEvent(
                                                              //         context,
                                                              //         TitleController
                                                              //             .text,
                                                              //         BeforeController
                                                              //             .text,
                                                              //         AfterController
                                                              //             .text,
                                                              //         patient,
                                                              //         from_where));

                                                              
                                                            },
                                                            child: const Icon(
                                                                Icons.save),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: const Text('إضافة'),
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                // style: ElevatedButton.styleFrom(
                                //     backgroundColor: const Color.fromARGB(
                                //         255, 106, 222, 49)),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('إغلاق'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

//تسنيق النافذة التي تظهر عند الضغط على الحدث الجاهز لتعبئة المعلومات الناقصة
Widget _buildPredefinedEvent(BuildContext context, String title,
    String beforeText, String afterText, Users patient, String from_where) {
  // قم بإنشاء وحدة تحكم للوصف وقم بتعيينها بقيمة فارغة عندما تفتح الـ AlertDialog
  final TextEditingController descriptionController =
      TextEditingController(text: '');

  return Directionality(
    textDirection: TextDirection.rtl,
    child: ListTile(
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 48, 135, 221)),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: AlertDialog(
                  title: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 48, 135, 221)),
                  ),
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextField(
                          controller:
                              descriptionController, // استخدم وحدة تحكم الوصف هنا
                          decoration: InputDecoration(
                              labelText:
                                  '$beforeText {القيمة المدخلة} $afterText'),
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
                        Navigator.pop(
                            context); // إغلاق الـ AlertDialog بدون تحديث الوصف
                      },
                      child: const Icon(Icons.cancel),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 106, 222, 49)),
                      onPressed: () {
                        // عند الضغط على زر حفظ في الـ AlertDialog، قم بتحديث الوصف في الحدث الجاهز.

                        final newDescription =
                            "$beforeText ${descriptionController.text} $afterText";
                        // تحديث الوصف في الحدث الجاهز.
                        // هنا يجب أن تجد حدثًا جاهزًا محددًا وتحدث الوصف فيه.
                        // ستحتاج إلى إضافة الكود اللازم لذلك وتحديد الحدث الصحيح.
                        // فيما يلي كود توضيحي بسيط.
                        final event = Event(
                          id: AllStatusConversations[
                                  patient.StatusConversationID]
                              .num_of_status_messages++,
                          title: title,
                          description: newDescription,
                          timestamp: DateTime.now().toString(),
                        );

                        if (from_where == 'health_screen') {
                          Provider.of<RecordTimelineProvider>(context,
                                  listen: false)
                              .addEvent(event, patient);
                          Navigator.pop(
                              context); // إغلاق الـ AlertDialog بعد تحديث الوصف
                          Navigator.pop(context);
                        } else if (from_where == 'record_screen') {
                          Provider.of<RecordTimelineProvider>(context,
                                  listen: false)
                              .addRecordEvent(event, patient);
                          Navigator.pop(
                              context); // إغلاق الـ AlertDialog بعد تحديث الوصف
                          Navigator.pop(context);
                        }
                      },
                      child: const Icon(Icons.send),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ),
  );
}
