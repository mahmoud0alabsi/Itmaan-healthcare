// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class CenterNextButton extends StatelessWidget {
  final AnimationController animationController;
  final VoidCallback onNextClick;
  const CenterNextButton(
      {Key? key, required this.animationController, required this.onNextClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _topMoveAnimation =
        Tween<Offset>(begin: const Offset(0, 5), end: const Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.0,
        0.2,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final _signUpMoveAnimation =
        Tween<double>(begin: 0, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.2,
        0.4,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final _loginTextMoveAnimation =
        Tween<Offset>(begin: const Offset(0, 5), end: const Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.2,
        0.4,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: 16 + MediaQuery.of(context).padding.bottom),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SlideTransition(
              position: _topMoveAnimation,
              child: AnimatedBuilder(
                animation: animationController,
                builder: (context, child) => AnimatedOpacity(
                  opacity: animationController.value >= 0.2 &&
                          animationController.value <= 0.6
                      ? 1
                      : 0,
                  duration: const Duration(milliseconds: 480),
                  child: _pageView(),
                ),
              ),
            ),
            SlideTransition(
              position: _topMoveAnimation,
              child: AnimatedBuilder(
                animation: animationController,
                builder: (context, child) => Padding(
                  padding: EdgeInsets.only(
                      bottom: 38 - (38 * _signUpMoveAnimation.value)),
                  child: Container(
                    height: 58,
                    width: 58 + (200 * _signUpMoveAnimation.value),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          8 + 32 * (1 - _signUpMoveAnimation.value)),
                      color: const Color.fromARGB(255, 72, 93, 223),
                    ),
                    child: PageTransitionSwitcher(
                      duration: const Duration(milliseconds: 480),
                      reverse: _signUpMoveAnimation.value < 0.7,
                      transitionBuilder: (
                        Widget child,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                      ) {
                        return SharedAxisTransition(
                          fillColor: const Color.fromARGB(0, 72, 93, 223),
                          animation: animation,
                          secondaryAnimation: secondaryAnimation,
                          transitionType: SharedAxisTransitionType.vertical,
                          child: child,
                        );
                      },
                      child: _signUpMoveAnimation.value > 0.7
                          ? InkWell(
                            
                              key: const ValueKey('Sign Up button'),
                              onTap: onNextClick,
                              child: const Padding(
                                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'تسجيل الدخول',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward_rounded,
                                        color: Colors.white),
                                  ],
                                ),
                              ),
                            )
                          : InkWell(
                              key: const ValueKey('next button'),
                              onTap: onNextClick,
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Icon(Icons.arrow_forward_ios_rounded,
                                    color: Colors.white),
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SlideTransition(
                position: _loginTextMoveAnimation,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pageView() {
    int _selectedIndex = 0;

    if (animationController.value >= 0.7) {
      _selectedIndex = 3;
    } else if (animationController.value >= 0.5) {
      _selectedIndex = 2;
    } else if (animationController.value >= 0.3) {
      _selectedIndex = 1;
    } else if (animationController.value >= 0.1) {
      _selectedIndex = 0;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < 2; i++)
            Padding(
              padding: const EdgeInsets.all(4),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 480),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: _selectedIndex == i
                      ? const Color.fromARGB(255, 72, 93, 223)
                      : const Color(0xffE3E4E4),
                ),
                width: 10,
                height: 10,
              ),
            )
        ],
      ),
    );
  }
}
