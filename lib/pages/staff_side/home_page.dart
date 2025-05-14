import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:my_tasks/models/users.dart';
import 'package:provider/provider.dart';
import 'HealthFollowUpPage.dart';
import 'package:get/get.dart';

import 'Models/Providers.dart';
// import 'Models/Record.dart';

import 'package:my_tasks/models/DB_Manegers/user_maneger.dart';

class HomePage extends StatefulWidget {
  final Users staff;
  const HomePage({super.key, required this.staff});

  @override
  _HomePageState createState() => _HomePageState(staff);
}

class _HomePageState extends State<HomePage> {
  Users staff;
  _HomePageState(this.staff);

  // void _openChatPage(BuildContext context, List<Map<String, String>> patients) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => ChatScreen(patients: patients)),
  //   );
  // }

  @override
  void initState() {
    // TODO: implement initState
    // UserManager.loadUsers();
    // print('Init state method ***************');
    // print(AllPatientUsers);
    super.initState();
  }

  bool check_if_empty(){
    bool all_removed = true;
    for(Users user in AllPatientUsers){
      if(user.isRemoved == false){
        all_removed = false;
        return false;
      }
    }

    if(AllPatientUsers.isEmpty || all_removed == true){
      return true;
    }

    return false;

  }


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TimelineProvider>(
            create: (_) => TimelineProvider()),
        ChangeNotifierProvider<RecordTimelineProvider>(
            create: (_) =>
                RecordTimelineProvider()), // إنشاء مزود بيانات للسجل الطبي
      ],
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.5,
            leading: IconButton(
              icon: const Icon(
                Icons.add,
                color: Color.fromRGBO(29, 93, 155, 1),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    String fName = "";
                    String lName = "";
                    String hosName = "";
                    String depName = "";

                    return Directionality(
                      textDirection: TextDirection.rtl,
                      child: Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 10,
                        child: Container(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'إضافة مريض جديد',
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
                                  padding: const EdgeInsets.all(24),
                                  child: Column(
                                    children: [
                                      TextField(
                                        onChanged: (value) {
                                          fName = value;
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'الاسم الأول',
                                          labelStyle: const TextStyle(
                                            color: Color(0xFF1D5D9B),
                                            fontSize: 18,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      TextField(
                                        onChanged: (value) {
                                          lName = value;
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'الاسم الأخير',
                                          labelStyle: const TextStyle(
                                            color: Color(0xFF1D5D9B),
                                            fontSize: 18,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      TextField(
                                        onChanged: (value) {
                                          hosName = value;
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'القسم',
                                          labelStyle: const TextStyle(
                                            color: Color(0xFF1D5D9B),
                                            fontSize: 18,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      TextField(
                                        onChanged: (value) {
                                          depName = value;
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'الغرفة',
                                          labelStyle: const TextStyle(
                                            color: Color(0xFF1D5D9B),
                                            fontSize: 18,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 7),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                if (fName.isEmpty ||
                                                    lName.isEmpty ||
                                                    hosName.isEmpty ||
                                                    depName.isEmpty) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      backgroundColor:
                                                          Colors.red,
                                                      content: Text(
                                                        ' يجب إدخال المعلومات المطلوبة بشكل صحيح.',
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                } else {
                                                  Navigator.of(context).pop();
                                                  setState(() {
                                                    create_patient_user(
                                                        'username',
                                                        '',
                                                        '',
                                                        fName,
                                                        lName,
                                                        '',
                                                        '',
                                                        hosName,
                                                        depName,
                                                        'patient');

                                                    // patients.add({
                                                    //   'name': patientName,
                                                    //   'room': roomNumber,
                                                    // });
                                                  });

                                                  // UserManager.loadUsers();
                                                }
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 48, 135, 221),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 18,
                                                  vertical: 13,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: const Text(
                                                'إضافة',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
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
              },
            ),
            title: Center(
                child: Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Text("اطمَئِنْ",
                  style: GoogleFonts.arefRuqaa(
                      color: const Color.fromRGBO(29, 93, 155, 1),
                      fontSize: 35)),
            )),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.qr_code_2,
                  color: Color.fromRGBO(29, 93, 155, 1),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Color.fromRGBO(29, 93, 155, 1),
                ),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: PatientSearchDelegate(),
                  );
                },
              ),
            ],
          ),
          body: check_if_empty()
              ? Column(
                mainAxisSize: MainAxisSize.max,
                children: [

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        
                        children: [
                          const Icon(
                                    size : 60.0,
                                    Icons.arrow_outward_rounded,
                                    color: Color.fromARGB(255, 48, 135, 221),
                                  )
                        ]
                        ),
                      ),
                    ],
                  ),


                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                  
                          Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    size : 100.0,
                                    Icons.no_accounts_outlined,
                                    color: Color.fromRGBO(29, 93, 155, 1),
                                  )
                                ]),
                  
                                SizedBox(
                              height: 12,
                            ),
                  
                  
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                        'لا يوجد ملفات مرضى مخزنة، قم بإضافة مريض جديد',
                                        style: TextStyle(fontSize: 15.0, color: Color.fromRGBO(29, 93, 155, 1)),),
                                  ),
                                ]),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('من خلال زر الإضافة العلوي',
                                  style: TextStyle(fontSize: 15.0, color: Color.fromRGBO(29, 93, 155, 1)),),
                                ]),
                  
                                SizedBox(
                              height: 8,
                            ),
                  
                                Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    size : 40.0,
                                    Icons.add,
                                    color: Color.fromRGBO(29, 93, 155, 1),
                                  )
                                ]),
                  
                  
                          ]),
                  ),
                ],
              )
              : ListView.builder(
                  itemCount: AllPatientUsers.length,
                  itemBuilder: (BuildContext context, int index) {
                    final patientName =
                        "${AllPatientUsers[index].f_name} ${AllPatientUsers[index].l_name}";
                    final roomNumber =
                        AllPatientUsers[index].department.toString();
                    if (AllPatientUsers[index].isRemoved) {
                      return const SizedBox.shrink();
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: GestureDetector(
                          onLongPress: () {
                            _showDeleteConfirmation(context, index);
                          },
                          onTap: () {
                            showPatientPopupMenu(
                                context, AllPatientUsers[index]);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(
                                  255, 48, 135, 221), // لون الشريط المعدل هنا
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(16),
                              leading: const CircleAvatar(
                                backgroundColor:
                                    Colors.white, // لون الخلفية للشعار
                                child: Icon(
                                  Icons.person,
                                  color: Color.fromRGBO(29, 93, 155,
                                      1), // لون الأيقونة باللون الأسود
                                ),
                              ),
                              title: Text(
                                patientName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white, // لون النص باللون الأبيض
                                ),
                              ),
                              subtitle: Text(
                                'رقم الغرفة: $roomNumber',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white, // لون النص باللون الأبيض
                                ),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward,
                                color:
                                    Colors.white, // لون الأيقونة باللون الأبيض
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 48, 135, 221),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.delete_forever,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'تأكيد الحذف',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'هل أنت متأكد أنك تريد حذف المريض؟',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF1D5D9B),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            AllPatientUsers[index].isRemoved = true;
                            Navigator.of(context).pop();
                            UserManager.saveUsers();
                          });
                          
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.all(16),
                          shape: const CircleBorder(),
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 45),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.all(16),
                          shape: const CircleBorder(),
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// btns of select follow up modal
Widget _buildPopupMenuButton(
    BuildContext context, IconData icon, String label, VoidCallback onTap) {
  return Column(
    children: [
      GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 48, 135, 221),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(100, 0, 0, 0),
                blurRadius: 10,
                spreadRadius: -2,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.all(14),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
      const SizedBox(height: 8),
      Text(
        label,
        style: const TextStyle(
          color: Color(0xFF1D5D9B),
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

// modal bulider
void showPatientPopupMenu(BuildContext context, Users patient) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 10,
          child: Container(
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 48, 135, 221),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          "${patient.f_name} ${patient.l_name}",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            "بيانات المريض: ",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 103, 103, 103)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "القسم: ${patient.hospital}",
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 103, 103, 103)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "الغرفة: ${patient.department}",
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 103, 103, 103)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "الرمز التعريفي: ${patient.patient_login_id}",
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 103, 103, 103)),
                          ),
                          IconButton(
                            icon: const Icon(Icons.content_copy_outlined),
                            onPressed: () {
                              Clipboard.setData(ClipboardData(
                                      text:
                                          patient.patient_login_id.toString()))
                                  .then((value) {
                                //only if ->
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text(
                                      'تم نسخ الرمز التعريفي بنجاح',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                );
                              }); // -> show a notification
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "رمز الأمان: ${patient.secure_code_login}",
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 103, 103, 103)),
                          ),
                          IconButton(
                            icon: const Icon(Icons.content_copy_outlined),
                            onPressed: () {
                              Clipboard.setData(ClipboardData(
                                      text:
                                          patient.secure_code_login.toString()))
                                  .then((value) {
                                //only if ->
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text(
                                      'تم نسخ رمز الأمان بنجاح.',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                );
                              }); // -> show a notification
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildPopupMenuButton(
                            context,
                            Icons.local_hospital_rounded,
                            "المتابعة الصحية",
                            () {
                              Navigator.of(context).pop();

                              Get.to(() => HealthFollowUpPage(patient: patient),
                                  transition: Transition.fadeIn,
                                  duration: const Duration(milliseconds: 500));

                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => HealthFollowUpPage(
                              //           patient:
                              //               patient)), // توجيه إلى واجهة المتابعة الصحية
                              // );
                            },
                          ),

                          // _buildPopupMenuButton(
                          //   context,
                          //   Icons.assignment,
                          //   "سجلات طبية",
                          //   () {
                          //     Navigator.of(context).pop();
                          //     // Navigator.push(
                          //     //   context,
                          //     //   MaterialPageRoute(
                          //     //       builder: (context) =>
                          //     //           MedicalRecordsScreen(patient: patient)),
                          //     // );

                          //     Get.to(
                          //         () => RecordScreen(
                          //               patient: patient,
                          //             ),
                          //         transition: Transition.fadeIn,
                          //         duration: const Duration(milliseconds: 500));

                          //     // Navigator.push(
                          //     //   context,
                          //     //   MaterialPageRoute(
                          //     //       builder: (context) => RecordScreen(
                          //     //             patient: patient,
                          //     //           )), // الانتقال إلى شاشة السجل الطبي
                          //     // );
                          //   },
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

class PatientSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_rounded),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Users> results = AllPatientUsers.where((patient) {
      return patient.f_name!.toLowerCase().contains(query.toLowerCase()) ||
          patient.l_name!.toLowerCase().contains(query.toLowerCase()) ||
          patient.department!.contains(query);
    }).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Directionality(
              textDirection:
                  TextDirection.rtl, // اتجاه النص من اليمين إلى اليسار
              child: GestureDetector(
                onTap: () {
                  showPatientPopupMenu(
                      context, results[index]); // عرض النافذة المنبثقة
                },
                child: ListTile(
                  title: Text(
                      '  ${"${results[index].f_name} ${results[index].l_name}"} '),
                  subtitle:
                      Text('  رقم الغرفة : ${results[index].department}  '),
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xFF75C2F6),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF75C2F6),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Icon(
              Icons.search,
              size: 64,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'ابحث عن المرضى من خلال الاسم أو رقم الغرفة.',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF1D5D9B),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
