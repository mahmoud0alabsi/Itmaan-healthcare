// import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';

// class QrCode extends StatefulWidget {
//   @override
//   _QrCodetate createState() => _QrCodetate();
// }

// class _QrCodetate extends State<QrCode> {

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('QR Code Generator'),
//         ),
//         body: Column(
//           children: [
//             // Form(
//             //   key: formKey,
//             //   child: Column(
//             //     children: [
//             //       TextFormField(
//             //         controller: nameController,
//             //         decoration: InputDecoration(labelText: 'Name'),
//             //         validator: (value) {
//             //           if (value == null || value.isEmpty) {
//             //             return 'Please enter a name';
//             //           }
//             //           return null;
//             //         },
//             //       ),
//             //       ElevatedButton(
//             //         onPressed: () {
//             //           if (formKey.currentState!.validate()) {
//             //             setState(() {
//             //               String name = nameController.text;
//             //               String data = DateTime.now()
//             //                   .toString(); // You can customize the data to include more information
//             //               Person person = Person(name: name, data: data);
//             //               people.add(person);
//             //               nameController.clear();
//             //             });
//             //           }
//             //         },
//             //         child: Text('Add Person'),
//             //       ),
//             //     ],
//             //   ),
//             // ),
            
            
//             // Expanded(
//             //   child: ListView.builder(
//             //     itemCount: people.length,
//             //     itemBuilder: (context, index) {
//             //       return ListTile(
//             //         title: Text(people[index].name),
//             //         onTap: () {
//             //           showDialog(
//             //             context: context,
//             //             builder: (BuildContext context) {
//             //               return AlertDialog(
//             //                 title: Text('QR Code for ${people[index].name}'),
//             //                 content: QrImage(
//             //                   data: people[index].data,
//             //                   version: QrVersions.auto,
//             //                   size: 200.0,
//             //                 ),
//             //               );
//             //             },
//             //           );
//             //         },
//             //       );
//             //     },
//             //   ),
//             // ),
          
//           QrImageView(
//                               data: people[index].data,
//                               version: QrVersions.auto,
//                               size: 200.0,
//                             ),
          
//           ],
//         ),
//       ),
//     );
//   }
// }