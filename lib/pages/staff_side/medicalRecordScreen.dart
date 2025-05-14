import 'package:flutter/material.dart';
import 'package:my_tasks/models/users.dart';


// void _openMedicalRecordsPage(BuildContext context) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => MedicalRecordsScreen()),
//   );
// }

class MedicalRecordsScreen extends StatefulWidget {

  final Users patient;
  const MedicalRecordsScreen({super.key, required this.patient});

  @override
  State<MedicalRecordsScreen> createState() => _MedicalRecordsScreenState(patient);
}

class _MedicalRecordsScreenState extends State<MedicalRecordsScreen> {

  Users patient;
  _MedicalRecordsScreenState(this.patient);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('سجلات طبية'),
      ),
      body: Column(children: [
        const Center(
          child: Text(
            "صفحة السجلات الطبية الفارغة هنا",
            style: TextStyle(fontSize: 20),
          ),
        ),

        Center(
          child: Text(
            ("${patient.f_name} ${patient.l_name}"),
            style: const TextStyle(fontSize: 20),
          ),
        ),

      ],)
    );
  }
}
