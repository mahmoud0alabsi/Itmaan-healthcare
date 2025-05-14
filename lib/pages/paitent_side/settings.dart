import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_tasks/models/users.dart';
import 'package:my_tasks/pages/login_pages.dart';

class SettingsPage extends StatelessWidget {
  final Users patient;
  const SettingsPage({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(
            Icons.archive,
            color: Color.fromRGBO(255, 255, 255, 0.0),
          ),
          onPressed: () {
          },
        ),
        title: Center(
            child: Text("الإعدادات",
                style: GoogleFonts.arefRuqaa(
                    color: const Color.fromRGBO(29, 93, 155, 1),
                    fontSize: 30))),
        actions: const [
          Icon(
            Icons.archive,
            color: Color.fromRGBO(255, 255, 255, 0.0),
          ),
          Icon(
            Icons.report,
            color: Color.fromARGB(0, 255, 255, 255),
          )
        ],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(32),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF846AFF),
                    Color(0xFF755EE8),
                    Colors.purpleAccent,
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(
                    16.0))), // Adds a gradient background and rounded corners to the container
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text(
                      "المعلومات المريض :",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 25.0),
                    ), // Adds a title to the card
                    Spacer(),
                    // Adds a stack of two circular containers to the right of the title
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "الاسم : ${patient.f_name} ${patient.l_name}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 16.0),
                    ), // Adds a title to the card
                    const Spacer(),
                    // Adds a stack of two circular containers to the right of the title
                  ],
                ),
                const SizedBox(height: 7),
                Text(
                  "الرمز التعريفي : ${patient.patient_login_id}",
                  style: const TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                const SizedBox(height: 7),
                Text(
                  "رمز الأمان : ${patient.secure_code_login}",
                  style: const TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                const SizedBox(height: 7),
                Text(
                  "القسم : ${patient.hospital}",
                  style: const TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                const SizedBox(height: 7),
                Text(
                  "الغرفة : ${patient.department}",
                  style: const TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
              child: ElevatedButton(
                onPressed: () {
                  _showDeleteAllPatientsConfirmation(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'تسجيل الخروج',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

void _showDeleteAllPatientsConfirmation(BuildContext context) {
  showDialog(
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const PatientScreen(),
                        ),
                      );
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
