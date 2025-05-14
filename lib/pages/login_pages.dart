import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_tasks/models/users.dart';
import 'package:google_fonts/google_fonts.dart';

import 'paitent_side/main_page.dart';
import 'staff_side/main_page.dart';

// ----------- Doctor Login page -----------
class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  _DoctorLoginScreenState createState() => _DoctorLoginScreenState();
}

class _DoctorLoginScreenState extends State<DoctorScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/doc-login.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          body: Align(
            alignment: FractionalOffset.bottomCenter,
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // صورة في الأعلى
                    // const SizedBox(height: 200),
                    // Container(
                    //   margin: const EdgeInsets.symmetric(vertical: 300),
                    //   child: const Padding(
                    //     padding: EdgeInsets.symmetric(vertical: 0),
                    //     child: SizedBox(height: 0),
                    //   ),
                    // ),
                    // // أيقونة الطبيب
                    // const FaIcon(
                    //   FontAwesomeIcons.userDoctor,
                    //   size: 50,
                    //   color: Color.fromARGB(255, 48, 135, 221),
                    // ),
                    const SizedBox(height: 6),
                    // نص "تسجيل دخول"
                    const Text(
                      'تسجيل دخول',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 48, 135, 221),
                      ),
                    ),
                    // نص "طبيب"
                    const Text(
                      'طبيب/ممرض',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 48, 135, 221),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // حقل البريد الإلكتروني
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 29, 93, 155),
                          ),
                          decoration: const InputDecoration(
                            labelText: 'البريد الإلكتروني',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 29, 93, 155)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 29, 93, 155)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 117, 194, 246)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0))),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // حقل كلمة السر
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          textAlign: TextAlign.end,
                          textDirection: TextDirection.ltr,
                          controller: passwordController,
                          obscureText: !_passwordVisible,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 29, 93, 155),
                          ),
                          decoration: InputDecoration(
                            // Here is key idea
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),

                            labelText: 'كلمة السر',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 29, 93, 155)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 29, 93, 155)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 117, 194, 246)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0))),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // زر تسجيل الدخول
                    ElevatedButton(
                      onPressed: () {
                        getNextScreen(
                            emailController.text, passwordController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 12),
                        backgroundColor:
                            const Color.fromARGB(255, 48, 135, 221),
                      ),
                      child: const Text(
                        'تسجيل الدخول',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: AlertDialog(
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.person,
                                          size: 40,
                                          color:
                                              Color.fromRGBO(46, 138, 199, 1),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "يمكنك استخدام معلومات الحساب التالية لتجربة التطبيق والدخول الى حساب طبيب/ممرض.",
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(29, 93, 155, 1),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        
                                        
                                        Row(children: [
                                          Text(
                                            "البريد الإلكتروني: ",
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  29, 93, 155, 1),
                                            ),
                                          ),

                                          TextButton(onPressed: () {
                                              Clipboard.setData(ClipboardData(
                                                      text: 'Itmaan@test.com'))
                                                  .then((value) {
                                                //only if ->
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    backgroundColor: Colors.red,
                                                    content: Text(
                                                      'تم نسخ البريد الإلكتروني بنجاح.',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }); // -> show a notification
                                            }, child: Text('Itmaan@test.com')
                                            ),

                                        ],
                                        ),
                                        const SizedBox(
                                          height: 0,
                                        ),
                                        Row(children: [
                                          Text(
                                            "الرمز السري: ",
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  29, 93, 155, 1),
                                            ),
                                          ),
                                          TextButton(
                                            child: Text('Itmaan2023'),
                                            onPressed: () {
                                              Clipboard.setData(ClipboardData(
                                                      text: 'Itmaan2023'))
                                                  .then((value) {
                                                //only if ->
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    backgroundColor: Colors.red,
                                                    content: Text(
                                                      'تم نسخ الرمز السري بنجاح.',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }); // -> show a notification
                                            },
                                          ),
                                        
                                        ]
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        
                                        Row(children: [
                                          Text('* اضغط على البيانات للنسخ')
                                        ],)
                                      
                                      ],
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 14, bottom: 14),
                                          child: const Text("إغلاق"),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                        child: const Text(
                          "لا تمتلك حساب؟",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        )),

                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  getNextScreen(String email, String password) {
    // اضافة شروط أو تحقق من كلمة السر هنا

    bool temp = true;

    for (Users user in AllStaffUsers) {
      if (user.user_role == "medical_staff" &&
          user.email?.toLowerCase() == email.toLowerCase() &&
          user.isRemoved != true) {
        if (user.passward == password) {
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute<void>(
          //     builder: (BuildContext context) =>
          //         StaffMainPage(staff: AllStaffUsers[0]),
          //   ),
          // );

          Get.off(() => StaffMainPage(staff: AllStaffUsers[0]),
              transition: Transition.leftToRight,
              duration: const Duration(milliseconds: 750));

          temp = false;
          break;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                'الرمز السري المدخل غير صحيح.',
                style: GoogleFonts.ibmPlexSansArabic(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          );
          temp = false;
          break;
        }
      }
    }

    if (temp) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'المعلومات المدخلة غير صحيحة أو المستخدم غير موجود.',
            style: GoogleFonts.ibmPlexSansArabic(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      );
    }

    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute<void>(
    //     builder: (BuildContext context) =>
    //         StaffMainPage(staff: AllStaffUsers[0]),
    //   ),
    // );
    // Navigator.push(
    //               context,
    //               MaterialPageRoute(builder: (context) => StaffMainPage(staff: AllStaffUsers[0])),
    //             );
    // for(Users user in AllStaffUsers){
    //   if(user.user_role == "medical_staff" && user.email == email){
    //     if (user.passward == password) {
    //       Navigator.push(
    //               context,
    //               MaterialPageRoute(builder: (context) => const StaffMainPage()),
    //             );
    //     }
    //     else{
    //       print("Password wrong");
    //     }
    //   }
    // }
    // print("User does not exist");
  }

  // getNextScreen(String email, String password) {

  //   bool temp = true;

  //   for(Users user in AllStaffUsers){
  //     if(user.user_role == "medical_staff" && user.email == email){
  //         if (user.passward == password) {
  //           Navigator.push(
  //                   context,
  //                   MaterialPageRoute(builder: (context) => StaffMainPage(staff : user)),
  //                 );
  //             temp = false;
  //             break;
  //         }
  //         else{
  //           ScaffoldMessenger.of(context)
  //             .showSnackBar(
  //               SnackBar(
  //                 backgroundColor: Colors.red,
  //                 content: Text(
  //                   'الرمز السري المدخل غير صحيح',
  //                   style: GoogleFonts.ibmPlexSansArabic(
  //                     color: Colors.white,
  //                     fontSize: 16,
  //                   ),
  //                 ),
  //               ),
  //             );
  //             temp = false;
  //             break;
  //         }
  //     }
  //   }

  //   if(temp){
  //     ScaffoldMessenger.of(context)
  //           .showSnackBar(
  //         SnackBar(
  //           backgroundColor: Colors.red,
  //           content: Text(
  //             'المعلومات المدخلة غير صحيحة أو المستخدم غير موجود',
  //             style: GoogleFonts.ibmPlexSansArabic(
  //               color: Colors.white,
  //               fontSize: 16,
  //             ),
  //           ),
  //         ),
  //       );
  //       }
  // }
}

class YellowScreen extends StatelessWidget {
  const YellowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Text(
          'صفحة صفراء',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class RedScreen extends StatelessWidget {
  const RedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text(
          'صفحة حمراء',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// ----------- Patient Login page -----------
class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  _PatientScreenState createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/patient-login.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          body: Align(
            alignment: FractionalOffset.bottomCenter,
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    // صورة في الأعلى

                    // Padding(
                    //   padding: const EdgeInsets.only(top: 15),
                    //   child: Image.asset(
                    //     "assets/images/hos-icon.png",
                    //     width: 150,
                    //     height: 230,
                    //   ),
                    // ),
                    const SizedBox(height: 15),
                    // أيقونة الطبيب
                    // const FaIcon(
                    //   FontAwesomeIcons.bedPulse,
                    //   color: Color.fromARGB(255, 48, 135, 221),
                    //   size: 50,
                    // ),
                    const SizedBox(height: 16),
                    // نص "تسجيل دخول"
                    const Text(
                      'تسجيل دخول',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 48, 135, 221),
                      ),
                    ),
                    // نص "طبيب"
                    const Text(
                      'أهل مريض',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 48, 135, 221),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // حقل الرقم التعريفي
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                          controller: emailController,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 29, 93, 155)),
                          decoration: const InputDecoration(
                            labelText: 'الرمز التعريفي الخاص بالمريض',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 29, 93, 155)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 29, 93, 155)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 117, 194, 246)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0))),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // حقل كلمة السر
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(

                          textAlign: TextAlign.end,
                          textDirection: TextDirection.ltr,

                          controller: passwordController,
                          obscureText: !_passwordVisible,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 29, 93, 155)),
                          decoration: InputDecoration(

                            // Here is key idea
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),

                            labelText: 'رمز الأمان',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 29, 93, 155)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 29, 93, 155)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 117, 194, 246)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0))),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // زر تسجيل الدخول
                    ElevatedButton(
                      onPressed: () {
                        getNextScreenPatient(
                            emailController.text, passwordController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        backgroundColor:
                            const Color.fromARGB(255, 48, 135, 221),
                      ),
                      child: const Text(
                        'تسجيل الدخول',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),

                    TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: AlertDialog(
                                    content: const Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.login_rounded,
                                          size: 40,
                                          color:
                                              Color.fromRGBO(46, 138, 199, 1),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "يمكنك الحصول على معلومات التسجيل الدخول الى الحساب الخاص بالمريض (الرمز التعريفي ورمز الأمان) من خلال طلب هذه المعلومات من أحد أفراد الكادر الطبي المسؤول عن المريض.",
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(29, 93, 155, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 14, bottom: 14),
                                          child: const Text("إغلاق"),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                        child: const Text(
                          "من أين احصل على هذه المعلومات؟",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        )),

                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  getNextScreenPatient(String idNumber, String securityCode) {
    bool temp = true;

    for (Users user in AllPatientUsers) {
      if (user.user_role == "patient" &&
          user.patient_login_id == idNumber &&
          user.isRemoved != true) {
        if (user.secure_code_login == securityCode) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => PatientMainPage(patient: user)),
          );
          temp = false;
          break;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                'رمز الأمان المدخل غير صحيح',
                style: GoogleFonts.ibmPlexSansArabic(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          );
          temp = false;
          break;
        }
      }
    }

    if (temp) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'المعلومات المدخلة غير صحيحة أو المستخدم غير موجود.',
            style: GoogleFonts.ibmPlexSansArabic(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      );
    }
  }
}
