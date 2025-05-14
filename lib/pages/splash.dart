import 'package:flutter/material.dart';
import 'package:my_tasks/introduction_animation/introduction_animation_screen.dart';

// ----------- Splash page -----------
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // استدعاء دالة تأخير لعرض الواجهة لمدة 4 ثواني
    Future.delayed(const Duration(seconds: 3), () {
      // تغيير الواجهة بعد انتهاء الفترة المحددة
      setState(() {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const IntroductionAnimationScreen()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash-page.png"),
            fit: BoxFit.cover,
          ),
        ),
    );
  }
}



