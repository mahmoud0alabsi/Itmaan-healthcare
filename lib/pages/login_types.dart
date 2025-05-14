import 'package:flutter/material.dart';
import 'login_pages.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';

// ----------- Select login type page -----------
class LoginTypesPage extends StatelessWidget {
  const LoginTypesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/login-types.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: WillPopScope(
        onWillPop: () async {
          bool willLeave = false;
          // show the confirm dialog
          await showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
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
                        child: const Center(
                          child: Text(
                            'تسجيل الخروج',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'هل أنت متأكد أنك تريد تسجيل الخروج؟',
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleIconButton(
                            icon: Icons.close,
                            backgroundColor: Colors.red,
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          CircleIconButton(
                            icon: Icons.check,
                            backgroundColor: Colors.blue,
                            onTap: () {
                              Navigator.of(context).pop();
                              SystemChannels.platform
                                  .invokeMethod('SystemNavigator.pop');
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            },
          );
          return willLeave;
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // صورة في الأعلى
                  // Image.asset(
                  //   'assets/images/Logo.png',
                  //   width: 250,
                  //   height: 150,
                  // ),
                  const SizedBox(height: 20),
                  // نص "أهلاً بكم في التطبيق"
                  const Text(
                    'أهلاً بك',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 48, 135, 221),
                        wordSpacing: 5),
                  ),
                  // نص "الرجاء اختيار التالي"
                  // Text(
                  //   'اطمَئِنْ',
                  //   style: GoogleFonts.arefRuqaa(
                  //       color: const Color.fromARGB(255, 29, 92, 155),
                  //       fontSize: 90,
                  //       textStyle: const TextStyle(
                  //         shadows: <Shadow>[
                  //           Shadow(
                  //             offset: Offset(2.0, 2.0),
                  //             blurRadius: 1.0,
                  //             color: Color.fromARGB(99, 92, 92, 92),
                  //           ),
                  //         ],
                  //       )),
                  // ),
                  const SizedBox(height: 8),
                  // نص "الرجاء اختيار التالي"
                  const Text(
                    'الرجاء اختيار التالي',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color.fromARGB(255, 48, 135, 221),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // اختيارين "الطبيب" و "المريض"
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.to(() => const DoctorScreen(),
                          transition: Transition.leftToRight,
                          duration: const Duration(milliseconds: 500));
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const DoctorScreen()),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 90, vertical: 15),
                      backgroundColor: const Color.fromARGB(255, 48, 135, 221),
                    ),

                    icon: const FaIcon(
                      FontAwesomeIcons.userDoctor,
                      size: 23,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ), // الأيقونة هنا
                    label: const Text(
                      'كادر طبي',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.to(() => const PatientScreen(),
                          transition: Transition.leftToRight,
                          duration: const Duration(milliseconds: 500));

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const PatientScreen()),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 15),
                      backgroundColor: const Color.fromARGB(255, 48, 135, 221),
                    ),

                    icon: const FaIcon(
                      FontAwesomeIcons.bedPulse,
                      color: Color.fromARGB(255, 255, 255, 255),
                      size: 20,
                    ),
                    // الأيقونة هنا
                    label: const Text(
                      'أهل مريض',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final VoidCallback onTap;

  const CircleIconButton({
    super.key,
    required this.icon,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
