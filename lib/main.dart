import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// import 'package:my_tasks/pages/temp/help_page.dart';
// import 'package:my_tasks/pages/temp/settings.dart';


// import 'pages/temp/home_page.dart';
// import 'pages/chats.dart';
// import 'pages/conversation.dart';

import 'models/users.dart';
// import 'models/status_conversations.dart';
// import 'models/conversations.dart';

import 'pages/splash.dart';

import 'pages/staff_side/Models/Providers.dart';
import 'package:get/get.dart';

// import 'models/db_helper.dart';


import 'package:my_tasks/models/DB_Manegers/user_maneger.dart';
import 'package:my_tasks/models/DB_Manegers/status_conv_maneger.dart';
import 'package:my_tasks/models/DB_Manegers/conv_chat_maneger.dart';
import 'package:my_tasks/models/DB_Manegers/predefined_events_maneger.dart';

Future<void> main() async { 
   
  runApp(const MainApp());

  create_staff_user('Itmaan', 'Itmaan@test.com', 'Itmaan2023', 'Itmaan', 'App', 'Doctor', 'Cardiology', '', '', 'PHH', 'Cardiology Department', 'medical_staff');


  await UserManager.loadUsers();
  await StatusConvManager.loadStatusConvs();
  await ConvChatManager.loadConvChats();
  await PreEventsManager.loadPreEvents();

  await Future.delayed(const Duration(milliseconds: 250));

}


// void addUserToDatabase() async {
//   final dbHelper = DatabaseHelper();
//   final newUser = Users();

//   newUser.staff_id = 1;
//   newUser.patient_id = 1;
//   newUser.username = 'john_doe';
//   newUser.email = 'john@example.com';
//   newUser.password = 'password123';
//   newUser.f_name = 'John';
//   newUser.l_name = 'Doe';
//   newUser.medical_staff_type = 'dr';
//   newUser.medical_staff_major = 'Cardiology';
//   newUser.user_role = 'medical_staff';

//   // Set other properties as needed

//   int userId = await dbHelper.insertUser(newUser);

//   print('User added with ID: $userId');
// }

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {        
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TimelineProvider>(create: (_) => TimelineProvider()),
        ChangeNotifierProvider<RecordTimelineProvider>(create: (_) => RecordTimelineProvider()), // إنشاء مزود بيانات للسجل الطبي
      ],
      child: GetMaterialApp(
        title: 'اطمَئِنْ',
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        // ),
        home: const SplashScreen(),
    
        debugShowCheckedModeBanner: false,
        // routes: {
        //   // 'chats': (context) => Chats(),
        //   // 'conversation': (context) => Conversation(),
        //   'home': (context) =>  const HomePage(),
        //   'help': (context) =>  const HelpPage(),
        //   'settings': (context) =>  const SettingsPage(),
        // },
        theme: ThemeData(
          textTheme: GoogleFonts.ibmPlexSansArabicTextTheme(),
        ),
      ),
    );
  }
}
