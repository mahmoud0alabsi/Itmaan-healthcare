import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'home_page.dart';
import 'chats.dart';
import 'help_page.dart';
import 'settings.dart';

import 'package:my_tasks/models/users.dart';
import 'package:my_tasks/pages/login_pages.dart';

class StaffMainPage extends StatefulWidget {
  final Users staff;
  const StaffMainPage({super.key, required this.staff});

  @override
  _StaffMainPageState createState() => _StaffMainPageState(staff);
}

class _StaffMainPageState extends State<StaffMainPage> {
  final Users staff;
  _StaffMainPageState(this.staff);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  // FirebaseAuth _auth = FirebaseAuth.instance;
  // User user;

  // Future<void> _getUser() async {
  //   user = _auth.currentUser;
  // }

  _navigate(Widget screen) {

    Get.to(() => screen,
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 400));
    // Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  }

  String shortcut = "no action set";

  // @override
  // void initState() {
  //   super.initState();
  //   _getUser();
  // }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(staff: staff),
      Chats(),
      HelpPage(),
      SettingsPage(staff: staff),
    ];

    return WillPopScope(
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
                            Get.off(() => const DoctorScreen(),
                                transition: Transition.rightToLeft,
                                duration: const Duration(milliseconds: 500),);

                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute<void>(
                            //     builder: (BuildContext context) =>
                            //         const DoctorScreen(),
                            //   ),
                            // );
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
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.0),
          child: Scaffold(
            key: _scaffoldKey,
            body: pages[_selectedIndex],
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Color.fromRGBO(7, 33, 58, 0.2),
                  ),
                ],
              ),
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                  child: GNav(
                    curve: Curves.easeOutExpo,
                    rippleColor: const Color.fromRGBO(117, 194, 246, 1),
                    hoverColor: const Color.fromRGBO(117, 194, 246, 1),
                    haptic: true,
                    tabBorderRadius: 20,
                    gap: 5,
                    activeColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    duration: const Duration(milliseconds: 400),
                    tabBackgroundColor: const Color.fromRGBO(29, 93, 155, 1),
                    textStyle: GoogleFonts.ibmPlexSansArabic(
                      color: Colors.white,
                    ),
                    tabs: [
                      GButton(
                        iconSize: _selectedIndex != 0 ? 25 : 25,
                        icon: _selectedIndex == 0
                            ? Icons.home //FlutterIcons.home_fou
                            : Icons
                                .home_outlined, //FlutterIcons.home_variant_outline_mco,
                        text: 'الرئيسية',
                      ),
                      GButton(
                        iconSize: 25,
                        icon: _selectedIndex == 1
                            ? Icons.chat
                            : //FlutterIcons.search1_ant,
                            Icons.chat_outlined,
                        text: 'المحادثات',
                      ),
                      GButton(
                        iconSize: 25,
                        icon: _selectedIndex == 2
                            ? Icons.help_center //Typicons.calendar
                            : Icons
                                .help_center_outlined, //Typicons.calendar_outline,
                        text: 'المساعدة',
                      ),
                      GButton(
                        iconSize: 25,
                        icon: _selectedIndex == 3
                            ? Icons.settings //Typicons.user
                            : Icons.settings_outlined, //Typicons.user_outline,
                        text: 'الإعدادات',
                      ),
                    ],
                    selectedIndex: _selectedIndex,
                    onTabChange: _onItemTapped,
                  ),
                ),
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
