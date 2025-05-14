import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:google_fonts/google_fonts.dart';

import '../Models/Providers.dart';

import 'package:my_tasks/models/users.dart';
import 'package:my_tasks/models/status_conversations.dart';

//الكودات البرمجية الخاصة بإضافة الأحداث وتنسيق الشاشة الخاصة بإضافة الحدث في شاشة المريض
class AddEventDialog extends StatelessWidget {
  final Users patient;
  const AddEventDialog({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return AddEventScreen(
      patient: patient,
    );
  }
}

class AddEventScreen extends StatefulWidget {
  final Users patient;
  const AddEventScreen({super.key, required this.patient});

  @override
  _AddEventScreenState createState() => _AddEventScreenState(patient);
}

class _AddEventScreenState extends State<AddEventScreen> {
  final Users patient;
  _AddEventScreenState(this.patient);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  File? selectedImage;
  int? selectedIconIndex;

  Future<void> _pickImage() async {
    setState(() {
      selectedImage = null;
      selectedIconIndex = null;
    });

    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }
  }

  // // ignore: non_constant_identifier_names
  // bool save_in_checkbox = false;

  // void checkboxCallBack(bool? checkboxState) {
  //     setState(() {
  //       save_in_checkbox = !save_in_checkbox;
  //     });
  //   }

  @override
  Widget build(BuildContext context) {
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
                        'إرسال تحديث للحالة',
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
                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          labelText: 'العنوان',
                          labelStyle: const TextStyle(
                            color: Color(0xFF1D5D9B),
                            fontSize: 18,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                          labelText: 'الوصف',
                          labelStyle: const TextStyle(
                            color: Color(0xFF1D5D9B),
                            fontSize: 18,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),

                      const SizedBox(height: 5),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //               Checkbox(
                      //                 activeColor: Colors.lightBlueAccent,
                      //                 value: save_in_checkbox,
                      //                 onChanged: checkboxCallBack,
                      //                 side: BorderSide(width: 2.0, strokeAlign: BorderSide.strokeAlignCenter),
                      //               ),
                      //               Text("حفظ في السجل الطبي", style: TextStyle(color: Color.fromARGB(255, 48, 135, 221)),),
                      //       ],
                      //   ),
                      // ),
                    

                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 231, 61, 70),
                              ),
                              onPressed: _pickImage,
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(Icons.image),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 106, 222, 49)),
                              onPressed: () async {
                                final title = titleController.text;
                                final description = descriptionController.text;

                                if (title.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text(
                                        'الرجاء إدخال عنوان صحيح',
                                        style: GoogleFonts.ibmPlexSansArabic(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  );
                                } 
                                else {
                                  final event = Event(
                                    id: AllStatusConversations[
                                            patient.StatusConversationID]
                                        .num_of_status_messages,
                                    title: title,
                                    description: description,
                                    timestamp: DateTime.now().toString(),
                                    image: selectedImage,
                                  );
                                  Provider.of<RecordTimelineProvider>(context,
                                          listen: false)
                                      .addEvent(event, patient);
                                  Navigator.pop(context);

                                  // if(save_in_checkbox){
                                  //   Provider.of<RecordTimelineProvider>(context,
                                  //         listen: false)
                                  //     .addRecordEvent(event, patient);
                                  // }
                                }
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(Icons.send),
                              ),
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
  }
}
